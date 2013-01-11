# encoding: utf-8

class PlaceUploader < CarrierWave::Uploader::Base


  include CarrierWave::RMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.name}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
