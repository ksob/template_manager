require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"

  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)

  # The following does not work correclty. 
  # Results in NameError unintitialized *
  # :reload_routes! triggers :devise_for which loads and caches the User class.
  # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  # require "rails/application"
  # Spork.trap_method(Rails::Application, :reload_routes!)

  require File.expand_path("../../config/environment", __FILE__)

  require 'rspec/rails'
  require 'devise/test_helpers'
  require 'database_cleaner'
  
  RSpec.configure do |config|
    config.mock_with :rspec
    
    config.include Devise::TestHelpers, :type => :controller

    config.before(:suite) do
      # This is only ran once per run
      DatabaseCleaner[:active_record].clean_with :truncation 
	  
	  # :transaction for active_record does not work
	  # it is crashing with "SQLite3::SQLException: cannot start a transaction within a transaction"
	  # when running over Spork
	  # so using :truncation as well
	  # details: https://github.com/cucumber/cucumber-rails/pull/130
	  # TODO: make to work with :transaction
      DatabaseCleaner[:active_record].strategy = :truncation 
	  
	  DatabaseCleaner[:mongoid].strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  
  # Devise caches the user class so we need to reload it
  load File.expand_path(File.dirname(__FILE__) + '/../app/models/user.rb')
  
  # uncomment if you want changes to factories to take effect on each run:
  # FactoryGirl.reload
  
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
end