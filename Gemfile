source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'

  # Testing with rspec-rails
  gem 'rspec-rails', '~> 3.5'

  # assert_template has been extracted to a gem. Include this for Testing controllers
  gem 'rails-controller-testing'

  # Factory Girl for testing
  gem "factory_girl_rails", "~> 4.0"

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# One popular add-on is a gem that communicates with PostgreSQL databases (pronounced “post-gres-cue-ell”, and often called “Postgres” for short). This is the type of database your Heroku server will be running, so you need to install the gem for your app to query the database. Because this gem is only needed for the Heroku server, we will add the pg gem in the production environment group. Go to your gemfile and add the following code:
group :production do
  gem 'pg'
end

# User Authentication with devise
gem 'devise'

# User Authorisation with cancancan
gem 'cancancan'

# Pagination with will_paginate
gem 'will_paginate', '~> 3.1.0'

# Payments Processing with Stripe
gem 'stripe'

# Security scanning with Brakeman
gem 'brakeman', :require => false

# Caching with Dalli (Ruby memcache client)
gem 'dalli'

# Dalli by default uses a single connection to each server. This works fine normally, but can be come a bottleneck in a multi-threaded environment and limit performance. In this case, Dalli support connection pooling, where multiple connections are created to MemCachier’s servers. 
gem 'connection_pool'
