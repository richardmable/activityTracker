Rails.application.config.middleware.use OmniAuth::Builder do
 
  provider :strava, 
  ENV['STRAVA_APP_ID'],   
  ENV['STRAVA_APP_SECRET'], 
  scope: 'public',
  info_fields: 'access_token, email, firstname, lastname',
  callback_url: 'http://localhost:3000/users/auth/strava/callback'

  provider :fitbit,
  ENV['FITBIT_APP_ID'],
  ENV['FITBIT_APP_SECRET'],
  callback_url: 'http://localhost:3000/users/auth/fitbit/callback'

end