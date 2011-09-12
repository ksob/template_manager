source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'


gem "cancan"
gem 'devise', '~> 1.4.5'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'mlb', '~> 0.5.5'
gem 'paperclip', '~> 2.3.16'

# if you need carrierwave you should use this line for now
gem "ckeditor", :git => "git://github.com/galetahub/ckeditor.git"

gem "carrierwave"
gem "mini_magick"


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
end

