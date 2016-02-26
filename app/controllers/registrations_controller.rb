class RegistrationsController < DeviseTokenAuth::OmniauthCallbacksController

  def omniauth_success
    super
    # update the user strava key with the newly created
    UserStravaKey.last.update(user_id: User.last.id)

  end
def redirect_callbacks
super
puts "REDIRECT:"
puts request.env['omniauth.params']
puts "AUTH INFO"
puts request.env['omniauth.auth'].credentials['token']
puts "REDIRECT END"
# create the user_strava_key and save it.
@strava_token = request.env['omniauth.auth'].credentials['token']
UserStravaKey.create(key_secret: @strava_token)
end

end

# example request for activities in the last week
# https://www.strava.com/api/v3/athletes/STRAVA USER ID/activities?access_token=STRAVA USER KEY&after=1455909365 (TIME IN SECONDS SINCE UNIX EPOCH, PULLS ONE WEEK OF DATA)
# Time.now.to_i - 604800
#<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=false token="14bf6814c16e14b0f08431e8ab0b064f8891b984"> 


#extra=#<OmniAuth::AuthHash all_ride_totals=nil raw_info=#<OmniAuth::AuthHash athlete_type=0 badge_type_id=1 
