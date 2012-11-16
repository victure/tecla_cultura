class Photo < ActiveRecord::Base
  attr_accessible :description, :picture_file, :gallery_id
  belongs_to :gallery
  mount_uploader :picture_file, PhotoUploader
  #after_create :upload_to_facebook


  def default_name
    id.to_s
  end

  def file_path
  	"#{Rails.root.to_s}/public#{self.picture_file}"
  end

  protected
  
  def upload_to_facebook
  	unless  gallery_id.nil
  		current_user.upload_photo(self)
  	end
  end
end
