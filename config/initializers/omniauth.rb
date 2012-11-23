OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_SECRET, scope: "publish_stream,create_event,user_events,friends_events,rsvp_event,read_friendlists,user_photos"
end

