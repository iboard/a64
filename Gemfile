source 'https://rubygems.org'

HOST_OS = RbConfig::CONFIG['host_os']

gem 'rails', '3.2.8'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
end

gem 'jquery-rails'

group :test do
  gem "rspec-rails"
  gem "spork"
  gem "capybara"
  gem 'test-unit'
  gem 'simplecov'
  gem 'database_cleaner'
end

group :development do
  gem "capistrano"
  gem "yard"
end

# APPLICATION
gem "haml-rails"
gem "mongoid", "~> 3.0.0"

# TOOLS AND HELPERS
gem "redcarpet"
gem 'therubyracer', '~> 0.10.2', :group => :assets
