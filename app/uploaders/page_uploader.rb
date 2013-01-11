# encoding: utf-8

class PageUploader < CarrierWave::Uploader::Base

include CarrierWave::RMagick
  storage :fog

  def store_dir
    "uploads/pages/#{model.name}/cover"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process :resize_to_fit => [200, 200]
  end

end
