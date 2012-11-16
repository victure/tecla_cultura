class PlaceType < ActiveRecord::Base
  attr_accessible :label_name, :name
  has_many :places
end
