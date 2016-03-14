class RegistrationsController < DeviseTokenAuth::OmniauthCallbacksController

	def omniauth_success
		super
		# destroy the user that fitbit oauth creates
		# if User.last.provider == 'fitbit_oauth2'
		# 	User.last.destroy
		# end
		# update the user strava key with the newly created user
		if User.last.provider == 'strava' && User.last.sign_in_count < 2
			Key.last.update(user_id: User.last.id)
		end

	end
	def redirect_callbacks
		get_resource_from_auth_hash
		create_token_info
		set_token_on_resource
		create_auth_params

		if resource_class.devise_modules.include?(:confirmable)
			# don't send confirmation email!!!
			@resource.skip_confirmation!
		end
		# if the provider is Strava and the sign in count is less than 2 (first time)
		# create the user with the Strava creds. this prevents an account with Fitbit being created
		if params['provider'] == 'strava'
			sign_in(:user, @resource, store: false, bypass: false)
			@resource.save!
			strava_login_creds
		end

		fitbit_info
	end

	def strava_login_creds
		puts request.env['omniauth.auth']
		# grab the user info from the returned omniauth hash
		strava_key_secret = request.env['omniauth.auth'].credentials['token']
		location = request.env['omniauth.auth'].extra.raw_info['city']
		avatar = request.env['omniauth.auth'].extra.raw_info['profile']
		premium = request.env['omniauth.auth'].extra.raw_info['premium']
		gender = request.env['omniauth.auth'].extra.raw_info['sex']
		weight = request.env['omniauth.auth'].extra.raw_info['weight']

		# create the user_strava_key and save it.
		Key.create(strava_key_secret: strava_key_secret)
		# create profile, which will then be associated with the user once created
		Profile.create(avatar_link: avatar, location: location, strava_premium: premium, gender: gender, weight: weight)
	end

	def fitbit_info
		# check if the current user is logged in and that the info is coming from Fitbit
		if get_current_user && params['provider'] == 'fitbit_oauth2'
			# grab the keys from the omniauth hash
			fitbit_key_secret = request.env['omniauth.auth'].credentials['token']
			fitbit_key_refresh = request.env['omniauth.auth'].credentials['refresh_token']
			User.find(current_user.id).key.update(fitbit_key_refresh: fitbit_key_refresh, fitbit_key_secret: fitbit_key_secret)
		end
	end

end



#<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=true expires_at=1457972799 refresh_token="368ab93c3e0a08039ec275c41a5924df84908c97f3cce88e7ffed295d9817486" token="eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NTc5NzI3OTksInNjb3BlcyI6InJwcm8gcmhyIHJzbGUgcmFjdCIsInN1YiI6IjIyRzVNMyIsImF1ZCI6IjIyN05GWSIsImlzcyI6IkZpdGJpdCIsInR5cCI6ImFjY2Vzc190b2tlbiIsImlhdCI6MTQ1Nzk2OTE5OX0.xEdEEOuPW7E1rNB8T9d8whi7dzIrYPiYpgDCJDOmj7Y"> extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash user=#<OmniAuth::AuthHash age=57 avatar="https://d6y8zfzc2qfsl.cloudfront.net/84216432-F4FE-59D8-423E-4439E583B209_profile_100_square.jpg" avatar150="https://d6y8zfzc2qfsl.cloudfront.net/84216432-F4FE-59D8-423E-4439E583B209_profile_150_square.jpg" averageDailySteps=0 corporate=false dateOfBirth="1958-03-30" displayName="Ellen" distanceUnit="en_US" encodedId="22G5M3" features=#<OmniAuth::AuthHash exerciseGoal=true> fullName="Ellen Browne" gender="FEMALE" glucoseUnit="en_US" height=172.8 heightUnit="en_US" locale="en_US" memberSince="2012-01-10" offsetFromUTCMillis=-14400000 startDayOfWeek="SUNDAY" strideLengthRunning=92.10000000000001 strideLengthRunningType="default" strideLengthWalking=71.4 strideLengthWalkingType="default" timezone="America/New_York" topBadges=[#<OmniAuth::AuthHash badgeGradientEndColor="A489E8" badgeGradientStartColor="38216E" badgeType="DAILY_STEPS" category="Daily Steps" cheers=[] dateTime="2014-03-09" description="20,000 steps in a day" earnedMessage="Congrats on earning your first High Tops badge!" encodedId="228TPP" image100px="http://static0.fitbit.com/images/badges_new/100px/badge_daily_steps20k.png" image125px="http://static0.fitbit.com/images/badges_new/125px/badge_daily_steps20k.png" image300px="http://static0.fitbit.com/images/badges_new/300px/badge_daily_steps20k.png" image50px="http://static0.fitbit.com/images/badges_new/badge_daily_steps20k.png" image75px="http://static0.fitbit.com/images/badges_new/75px/badge_daily_steps20k.png" marketingDescription="You've walked 20,000 steps  And earned the High Tops badge!" mobileDescription="When it comes to steps, it looks like you're not playing around. This achievement was a slam dunk." name="High Tops (20,000 steps in a day)" shareImage640px="http://static0.fitbit.com/images/badges_new/386px/shareLocalized/en_US/badge_daily_steps20k.png" shareText="I took 20,000 steps and earned the High Tops badge! #Fitbit" shortDescription="20,000 steps" shortName="High Tops" timesAchieved=4 value=20000>, #<OmniAuth::AuthHash badgeGradientEndColor="FFDB01" badgeGradientStartColor="D99123" badgeType="LIFETIME_DISTANCE" category="Lifetime Distance" cheers=[] dateTime="2014-02-04" description="2,983 lifetime miles" earnedMessage="Whoa! You've earned the Sahara badge!" encodedId="22B8MP" image100px="http://static0.fitbit.com/images/badges_new/100px/badge_lifetime_miles2983.png" image125px="http://static0.fitbit.com/images/badges_new/125px/badge_lifetime_miles2983.png" image300px="http://static0.fitbit.com/images/badges_new/300px/badge_lifetime_miles2983.png" image50px="http://static0.fitbit.com/images/badges_new/badge_lifetime_miles2983.png" image75px="http://static0.fitbit.com/images/badges_new/75px/badge_lifetime_miles2983.png" marketingDescription="By reaching 2,983 lifetime miles, you've earned the Sahara badge!" mobileDescription="Whoa! You've walked the length of the Sahara Desert, which stretches from the Atlantic Ocean to t

