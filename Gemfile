source 'http://rubygems.org'

gem 'sprockets', '2.0.0.beta.15'
gem 'rails', '~> 3.1.0.rc6'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'


gem "cancan"
gem 'devise', '~> 1.4.2'
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

  platforms :jruby do
    gem 'jruby-openssl', '~> 0.7'
    # activerecord-jdbc-adapter does not yet have a rails 3.1 compatible release
    gem 'activerecord-jdbc-adapter', :git => 'https://github.com/nicksieger/activerecord-jdbc-adapter.git'
    case ENV['CI_DB_ADAPTER']
    when 'mysql'
      gem 'activerecord-jdbcmysql-adapter', '~> 1.1'
      gem 'jdbc-mysql', '~> 5.1'
    when 'postgresql'
      gem 'activerecord-jdbcpostgresql-adapter', '~> 1.1'
      gem 'jdbc-postgres', '~> 9.0'
    else
      gem 'activerecord-jdbcsqlite3-adapter', '~> 1.1'
      gem 'jdbc-sqlite3', '~> 3.6'
    end
  end

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

