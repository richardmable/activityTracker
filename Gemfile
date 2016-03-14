source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# For Angular templates with Rails
gem 'angular-rails-templates', '~> 1.0'
#for the respond_to feature
gem 'responders', '~> 2.0'
#for sending cookies to Angular and validating the header
gem 'angular_rails_csrf'
# for better erros
gem 'better_errors'
# for pulling in ENV vars from yml file
gem 'figaro'
# omniAuth ruby gem for authenticating with Strava
gem 'omniauth-strava'
# omniAuth ruby gem for authenticating with Fitbit
gem 'omniauth-fitbit-oauth2'
# secure token based authentication designed to work with ng-token-auth module
gem 'devise_token_auth'
# provides support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications
gem 'rack-cors', :require => 'rack/cors'
gem 'devise'
gem 'omniauth'
gem 'awesome_print'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #for loading ENV vars for development
  gem 'foreman'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

end

group :development do
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	# Access an IRB console on exception pages or by using <%= console %> in views
	gem 'web-console', '~> 2.0'
end

group :production do
  #for heroku
  gem 'rails_12factor'
  #postgres gem for production on heroku
  gem 'pg'
end