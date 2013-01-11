class Photo < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :description, :picture_file, :gallery_id
  belongs_to :gallery
  mount_uploader :picture_file, PhotoUploader
  before_destroy do |photo|
    photo.remove_picture_file
  end

  def default_name
    id.to_s
  end

  def file_path
  	picture_file.url
  end

  protected
  
  def upload_to_facebook
  	unless  gallery.nil?
  		current_user.upload_photo(self)
  	end
  end
end
