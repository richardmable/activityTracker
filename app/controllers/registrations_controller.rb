class RegistrationsController < DeviseTokenAuth::OmniauthCallbacksController

	def omniauth_success
		super
		# update the user strava key with the newly created
		Key.last.update(user_id: User.last.id)
	end
	def redirect_callbacks
		super
		puts request.env['omniauth.auth']
		# grab the user info from the returned omniauth hash
		key_secret = request.env['omniauth.auth'].credentials['token']
		location = request.env['omniauth.auth'].extra.raw_info['city']
		avatar = request.env['omniauth.auth'].extra.raw_info['profile']
		premium = request.env['omniauth.auth'].extra.raw_info['premium']
		gender = request.env['omniauth.auth'].extra.raw_info['sex']
		weight = request.env['omniauth.auth'].extra.raw_info['weight']

		# create the user_strava_key and save it.
		Key.create(strava_key_secret: key_secret)
		# create profile, which will then be associated with the user once created
		Profile.create(avatar_link: avatar, location: location, strava_premium: premium, gender: gender, weight: weight)
	end
end

