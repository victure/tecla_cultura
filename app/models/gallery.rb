class Gallery < ActiveRecord::Base
  attr_accessible :event_id, :description, :name, :fb_oid
  belongs_to :events
  has_many :photos
end
