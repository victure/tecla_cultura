if Rails.env.test? # Store the files locally for test environment
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.development? or Rails.env.production? # Using Amazon S3 for Development and Production
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'uploads'

    config.storage = :fog
    config.fog_credentials = {
        :provider => 'AWS', # required
        :aws_access_key_id => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX', # required
        :aws_secret_access_key => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', # required
    }
    config.fog_directory = 'tecla_cultura' # required
  end
end
