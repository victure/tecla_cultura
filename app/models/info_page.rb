class InfoPage < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :content, :name, :cover_image, :description
  mount_uploader :cover_image, PageUploader
end
