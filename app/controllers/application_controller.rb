class ApplicationController < ActionController::Base
	# set the users by their token
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :json
  
  # the following are functions to make sure CORS are served correctly
  # http://stackoverflow.com/questions/28711175/getting-ng-token-auth-to-work-with-devise-token-auth
  before_filter :add_allow_credentials_headers
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  # for fixing current_user =  nil issue https://github.com/lynndylanhurley/devise_token_auth/issues/74
  # add  before_action :authenticate_current_user to any controllers that use current_user
  def authenticate_current_user
    render json: {}, status: :unauthorized if get_current_user.nil?
  end

  def get_current_user
    return nil unless cookies[:auth_headers]
    auth_headers = JSON.parse cookies[:auth_headers]

    expiration_datetime = DateTime.strptime(auth_headers["expiry"], "%s")
    current_user = User.find_by uid: auth_headers["uid"]

    if current_user &&
       current_user.tokens.has_key?(auth_headers["client"]) &&
       expiration_datetime > DateTime.now

      @current_user = current_user
    end
    @current_user
  end

  # CORS settings to ensure tokens are being sent properly
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

  def add_allow_credentials_headers
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#section_5
    #
    # Because we want our front-end to send cookies to allow the API to be authenticated
    # (using 'withCredentials' in the XMLHttpRequest), we need to add some headers so
    # the browser will not reject the response
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def strava_response
    # this makes an API request to Strava for the authenticated athlete's 
    # last 4 weeks of activities
    # the Time.now.to_i - 2419200 gives the UNIX epoch time of 4 weeks ago
    uri = URI("https://www.strava.com/api/v3/athletes/#{current_user.uid}/activities?access_token=#{current_user.user_strava_key.key_secret}&after=#{Time.now.to_i - 2419200}")
    response = Net::HTTP.get(uri)
    # parse the response
    parsed = JSON.parse(response)
    # rotate through each response and create an activity for it, associated with the user who made the request
    # need to add in some logic so that it won't create activities that already exist, use 'name' maybe?
    parsed.each do |x|
      date = x['start_date_local']
      # taking just the year month day from start_date_local
      date = date[0..9]
      Activity.create(user_id: current_user.id, name: x["name"], distance: x['distance'], moving_time: x['moving_time'], activity_type: x['type'], start_date_local: date, average_heartrate: x['average_heartrate'], device_watts: x['device_watts'], average_watts: x['average_watts'], kilojoules: x['kilojoules'], suffer_score: x['suffer_score'])
    end 
  end

  # action to serve to Angular application
  def angular
  	render 'layouts/application'
  end
end



