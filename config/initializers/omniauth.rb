Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :github,        ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'],   scope: 'email,profile'
  # provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :strava, ENV['STRAVA_APP_ID'],   ENV['STRAVA_APP_SECRET'], scope: 'public'
end