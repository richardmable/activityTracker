Rails.application.config.middleware.use OmniAuth::Builder do
 
  provider :strava, 
  ENV['STRAVA_APP_ID'],   
  ENV['STRAVA_APP_SECRET'], 
  scope: 'public',
  callback_url: 'http://localhost:3000/users/auth/strava/callback'

  provider :fitbit_oauth2,
  ENV['FITBIT_APP_ID'],
  ENV['FITBIT_APP_SECRET'],
  scope: 'activity heartrate profile sleep',
  callback_url: 'http://localhost:3000/omniauth/fitbit_oauth2/callback'

end
