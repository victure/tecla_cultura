# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/galleries/#{model.gallery.name}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  

end
