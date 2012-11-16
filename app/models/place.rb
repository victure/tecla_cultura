class Place < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :place_type_id, :state, :twitter_account, :web_page
  belongs_to :place_type
  has_many :events
  def location
  	"#{name.titleize}, #{address}."
  end
end
