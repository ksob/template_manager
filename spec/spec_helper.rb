require 'rubygems'
require 'spork'

# overwrite after_set_user hook that crashes tests
# probably it is caused by database cleaner, that is it accesses database
# user that is gone by the time the hook fires
require 'warden'
module Warden
  module Hooks
    def after_set_user(options = {}, method = :push, &block)
    end
  end
end

Spork.prefork do
  if ENV["RUBYMINE_HOME"]
    $:.unshift(File.expand_path("rb/testing/patch/common", ENV["RUBYMINE_HOME"]))
    $:.unshift(File.expand_path("rb/testing/patch/bdd", ENV["RUBYMINE_HOME"]))
  end

  ENV["RAILS_ENV"] ||= "test"

  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)

  require File.expand_path("../../config/environment", __FILE__)

  require 'rspec/rails'
  require 'devise/test_helpers'
  require 'database_cleaner'

  DatabaseCleaner[:active_record].strategy = :transaction
  DatabaseCleaner[:mongoid].strategy = :truncation

  RSpec.configure do |config|

    require 'rspec/expectations'

    config.include RSpec::Matchers
    config.include Warden::Test::Helpers

    config.before(:each) do
      user = RailsAdmin::AbstractModel.new("User").create(
          :email => "username@example.com",
          :password => "password"
      )
      login_as user
    end

    config.mock_with :rspec
    config.include Devise::TestHelpers, :type => :controller
    config.before(:suite) {}

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
      Warden.test_reset!
    end

  end
end

Spork.each_run do
  # Devise caches the user class so we need to reload it
  load File.expand_path(File.dirname(__FILE__) + '/../app/models/user.rb')

  # uncomment if you want changes to factories to take effect on each run:
  # FactoryGirl.reload

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
end