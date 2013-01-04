class Place < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :address, :description, :name, :phone, :place_type_id, :state, :twitter_account, :web_page,:map_zoom, :map_latlng,:fanpage,:cover_image
  belongs_to :place_type
  has_many :events
  mount_uploader :cover_image, PlaceUploader
  scope :actives, where(:state=>true)
  scope :in_actives, where(:state=>false)
  def location
  	"#{name.titleize}, #{address}."
  end
       
	def twitter_full_url
	    "http://twitter.com/#{self.twitter_account.gsub!("@","")}"
	end

  def fb_fanpage_full
    "www.facebook.com/#{self.fanpage}"
  end

  def lat
    map_latlng.delete("(").delete(")").strip.split(",")[0].strip unless map_latlng.nil?
  end

   def zoom
    self.map_zoom.blank? ? 15 : self.map_zoom
  end

  def lng
    map_latlng.delete("(").delete(")").strip.split(",")[1].strip unless map_latlng.nil?
  end

  def self.places_for_map
    places = {}
    Place.all.each do |place|
      places[place.id.to_s.to_sym] = {:name=>place.name,:description=>place.description,:place_type=>place.place_type.name,:lat=>place.lat, :lng=>place.lng,:thumb=>place.cover_image.thumb.url}
    end
    return places
  end

end
