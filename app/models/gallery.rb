class Gallery < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :event_id, :description, :name, :fb_oid
  belongs_to :events
  has_many :photos, :dependent => :destroy
end
