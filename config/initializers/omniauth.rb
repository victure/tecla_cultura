OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_SECRET, scope: "email,publish_stream,create_event,read_friendlists,user_photos"
end

