source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
# Use postgresql as the database for Active Record
gem 'pg', '0.20'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# To support hotels' country codes
gem 'iso_country_codes'

# User authentication
gem 'devise'

# testing the correct user creation (at signup)
gem 'capybara', "<3.2.0"

# Handle user authorizations
gem "pundit"

# User authentication token management
gem "simple_token_authentication"

# 'Monetization' of prices
gem 'money-rails'

# To pick user-preferred language and currency
gem 'http_accept_language'

# For the translation of model fields
gem 'globalize', '~> 5.1.0', git: 'https://github.com/globalize/globalize'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-byebug'
  # testing
  gem 'rspec-rails'
  gem 'faker'
  # Object factory for testing
  gem 'factory_bot_rails'
  gem 'rubocop'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

