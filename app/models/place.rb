class Place < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :address, :description, :name, :phone, :place_type_id, :state, :twitter_account, :web_page,:map_zoom, :map_latlng,:fanpage
  belongs_to :place_type
  has_many :events
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
    map_latlng.delete("(").delete(")").strip.split(",")[0] unless map_latlng.nil?
  end

   def zoom
    self.map_zoom.blank? ? 15 : self.map_zoom
  end

  def lng
    map_latlng.delete("(").delete(")").strip.split(",")[1] unless map_latlng.nil?
  end

end
