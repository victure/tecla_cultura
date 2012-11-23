class Place < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :address, :description, :name, :phone, :place_type_id, :state, :twitter_account, :web_page
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
end
