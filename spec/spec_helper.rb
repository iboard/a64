require 'simplecov'
SimpleCov.coverage_dir('coverage')
SimpleCov.start 'rails'

require 'rubygems'
require 'spork'

require "rails/mongoid"
Spork.trap_class_method(Rails::Mongoid, :load_models)

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)

  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.coverage_dir('coverage')
    SimpleCov.start 'rails'
  end

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  RSpec.configure do |config|
    config.mock_with :rspec
    config.infer_base_class_for_anonymous_controllers = false  
    config.order = "random"
    # Clean up the database
    require 'database_cleaner'
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = "mongoid"
    end

    config.before(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.coverage_dir('coverage')
    SimpleCov.start 'rails'
  end
end
