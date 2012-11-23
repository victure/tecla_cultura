class InfoPage < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :content, :name
end
