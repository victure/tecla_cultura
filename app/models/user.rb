class User < ActiveRecord::Base
  cattr_accessor :current_user
	attr_accessible :fb_url, :image, :name, :oauth_expires_at, :oauth_token, :provider, :uid, :is_admin

	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.image = auth.image
	    user.is_admin = FACEBOOK_ADMINS.include?(auth.uid)
	    user.save!
	  end
	end

	def graph
	  	@facebook ||= Koala::Facebook::API.new(oauth_token)
	  	block_given? ? yield(@facebook) : @facebook
		rescue Koala::Facebook::APIError => e
		  logger.info e.to_s
		  nil # or consider a custom null object
	end

	def create_fb_event(event)
		begin
			print "\nfb_oid.nil=>#{event.fb_oid.nil?}\n"
			if event.fb_oid.nil?
				print "\n=======>Crando Envento en Facebook....<=======\n"
				params = {
				    :picture => event.flayer.url,
				    :name => event.name,
				    :description => event.description,
				    :start_time => event.date_at,
				    :location => event.location 
				}
				fb_oid = graph.put_object('me', 'events', params )
				print "\nfb_oid=>#{fb_oid}\n"
				event.fb_oid = fb_oid["id"]
				event.save
				invite_friends(event)
			end
		rescue
			print "\nFail Publishing event to facebook\n"
		end
		
	end

	def update_fb_event(event,changes)
		if changes.has_key?(:picture)
			path = "#{Rails.root.to_s}/public#{changes[:pictures]}"
			changes[:pictures] = Koala::UploadableIO.new(File.open(path))
		end
		graph.put_object(event.fb_oid,"",changes)
	end

	def friends
		graph.get_connections("me","friends")
	end

	def invite_friends(event)
		@friends ||=friends
		@friends.map{|friend| friend["id"]}.each_slice(50).to_a.map{ |friends_group| friends_group.join(",")}.each do |invite_to|
			begin
				result = graph.put_connections(event.fb_oid,"invited",:users=> invite_to )
				print "\ninviting=>#{invite_to}=>#{result}\n"
			rescue Koala::Facebook::APIError
				print "\nfail=>#{invite_to}\n"
				next
			end
		end
	end

	def create_album(gallery)
		params = {
			:name => gallery.name,
			:message => gallery.description,
			:privacy => {:value=>"EVERYONE"}.to_json
		}
		fb_oid = graph.put_object('me', 'albums', params )
		gallery.fb_oid = fb_oid["id"]
		gallery.save 
	end

	def update_fb_gallery(gallery,changes)
		graph.put_object(gallery.fb_oid,changes)
	end

	def upload_photo(photo) 
		begin
			path = photo.file_path
			print"\nSubiendo foto a facebook...\n"
			print"\nurl=>#{photo.file_path}...\n"
			graph.put_picture(photo.file_path, {:message => photo.description}, photo.gallery.fb_oid)
		rescue
			print "\nfail uploading=>#{photo.file_path}...\n"
		end
		
	end

	def upload_photos(photos)
		photos.each do |photo|
			graph.put_picture(photo.file_path, {:message => photo.description}, photo.gallery.fb_oid) 
		end
	end

	def attend_to(event_id)
		begin
			event = Event.find(event_id) 
			result = graph.put_connections(event.fb_oid,"attending")
		rescue Koala::Facebook::APIError
			result = false
		end
	end


end
