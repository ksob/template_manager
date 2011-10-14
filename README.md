template-manager
================

A Rails 3.1 application allowing for user-driven form creation / generation, where the user can design, create and fill its own HTML forms all on the runtime. 

It is a Rails 3.1 application - not engine. It is using a hybrid of MongoDB and transactional db. MongoID for dynamic MongoDB access and ActiveRecord for the transactional side.

It uses all the standard gems introduced in Rails 3.1 including (SASS, JQuery, CoffeeScript).
In addition it incorporates the following:

* MongoID
* Rails admin with Devise 
* ckeditor
* CanCan
* HTML5 boilerplate 
* JQuery UI 
* some pieces from twitter-bootstrap-sass
* RSpec and Cucumber
* FactoryGirl
* Spork with Guard
* Database cleaner
* Nokogiri
* simple-navigation


Compatibility
=============

Developed and tested using the following setup:

	$ ruby -v
	ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin10.7.0]
	$ rails -v
	Rails 3.1.0
	
Installation
============

git clone git://github.com/ksob/template_manager.git
cd ./template_manager
bundle install
		
Running app (in development environment)
======================================

Make sure your MongoDB installation and configuration matches that of config/mongoid.yml and that it is running.
Then run all the standard stuff:
	
	bundle install --without test production
	RAILS_ENV=development rake db:create
	RAILS_ENV=development rake db:migrate
	rails s
	
The project is configured to use Guard that is automatically running Cucumber and RSpec tests when it detects any change to code under test so you would also like to issue this command in a separate terminal when developing:
 	
	guard
	
Usage
=====

Create first user using Sign Up button, go to Admin Area and create a few Form Templates, then go back to http://localhost:3000/ and you should be able to fill the templates. After you have filled up a few of them then you should be able to perform all the CRUD on the Filled Forms.
	
Running test suite
==================

Make sure your MongoDB installation and configuration matches that of config/mongoid.yml and that it is running.
Then run all the standard stuff:

    bundle install --without production
	RAILS_ENV=test rake db:create
	RAILS_ENV=test rake db:migrate
	bundle exec cucumber
	RAILS_ENV=test bundle exec rake spec
		
Running app in production environment
=====================================

Make sure your MongoDB and PostgreSQL (or any other relational db) installation and configuration matches that of config/mongoid.yml and config/database.yml.
Then run:

	bundle install --without development test cucumber
	
From now on each successive command must have access to MongoDB specific variables that are specified in config/mongoid.yml: 	

	production:
	  host: <%= ENV['MONGOID_HOST'] %>
	  port: <%= ENV['MONGOID_PORT'] %>
	  username: <%= ENV['MONGOID_USERNAME'] %>
	  password: <%= ENV['MONGOID_PASSWORD'] %>
	  database: <%= ENV['MONGOID_DATABASE'] %>

Then run all the standard stuff:

	RAILS_ENV=production rake assets:precompile
	RAILS_ENV=production rake db:create
	RAILS_ENV=production rake db:migrate
	RAILS_ENV=production rails s

Notes
=====
	
As of 14 October 2011 I am experiencing some troubles getting environment reporting to work properly when running rake.
It maybe caused by my non traditional hybrid db setup or bug rails/rake itself. 
Due to that you should run all rake commands explicitly specifying environment via RAILS_ENV. 
Follow up: https://github.com/RailsApps/rails3-mongoid-devise/issues/9
	
License
=======

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.