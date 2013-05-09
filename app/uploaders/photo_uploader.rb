# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
  
  # Elegir que tipo de almacenamiento se va utilizar:
  # :file se utiliza el sistema de archivos del servidor donde se hostea la aplicacion
  # :fog se utiliza para algun almacenamiento remoto como aws o rackspace
  #      si se quiere utilizar aws-s3 para almacenamiento remote ver el archivo carrierwave.rb dentro de config/initializers
  storage :file
  #storage :fog


  def store_dir
    "uploads/galleries/#{model.gallery.name}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [60, 60]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  

end
