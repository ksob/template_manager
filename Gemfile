require 'rbconfig'
HOST_OS = Config::CONFIG['host_os']

source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'

gem "bson_ext", "~> 1.3"
gem "carrierwave"
gem "mini_magick"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

if HOST_OS =~ /linux/i
  gem 'therubyracer', '>= 0.8.2'
end

gem "mongoid", "~> 2.2"

gem "cancan"
gem 'devise', '~> 1.4.5'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'mlb', '~> 0.5.5'
gem 'paperclip', '~> 2.3.16'

# if you need carrierwave you should use this line for now
gem "ckeditor", :git => "git://github.com/galetahub/ckeditor.git"

gem 'nokogiri'
gem "simple-navigation"

group :development do
  gem "metric_fu", ">=1.5.1"
  gem "guard", ">= 0.6.2"
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'win32console'
      gem 'rb-notifu'
  end
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem 'guard-spork'
  gem 'guard-rspec', ">= 0.4.3"
  gem 'guard-cucumber', ">= 0.6.1"
end

group :development, :test do
  # Pretty printed test output
  gem 'turn', :require => false
  platforms :ruby, :mswin, :mingw do
    case ENV['CI_DB_ADAPTER']
    when 'mysql'
      gem 'mysql', '~> 2.8'
    when 'postgresql'
      gem 'pg', '~> 0.10'
    else
      gem 'sqlite3', '~> 1.3'
    end
  end
  gem "factory_girl_rails"
  gem "rspec-rails", ">=2.0.1"
  gem "webrat", "~> 0.7.3"
  gem "evergreen", :require => "evergreen/rails"
  platforms :mri_18 do
    gem "ruby-debug"
  end
  platforms :mri_19 do
    gem "ruby-debug19", :require => 'ruby-debug'
  end
end

group :test do
  gem "rspec", ">=2.0.1"
  gem "remarkable", ">=4.0.0.alpha4"
  gem "remarkable_activemodel", ">=4.0.0.alpha4"
  gem "remarkable_activerecord", ">=4.0.0.alpha4"
  gem "remarkable_mongoid", "~> 0.6.0"
  gem "mongoid-rspec"
  gem "launchy", ">= 2.0.5"
end

group :cucumber do
  gem "cucumber", ">=0.6.3"
  gem "cucumber-rails", ">=0.3.2"
  gem "capybara", ">=0.3.6"
  gem "pickle", ">=0.4.2"
end

group :development, :test do
  gem "database_cleaner", ">=0.6.6"
  gem "spork", ">=0.8.4"
end

group :production do
  gem 'pg', '~> 0.10'
end
