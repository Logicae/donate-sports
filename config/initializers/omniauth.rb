Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  provider :github, '73759f155ffb3f7d6df6', '1b8c7aa0de22c682fc38a290cc8c645ab6170a70'
end
