class PlaceType < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :label_name, :name
  has_many :places
end
