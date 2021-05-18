source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg', '~> 0.20.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
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
gem 'jquery-ui-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'factory_bot_rails'
  gem "binding_of_caller"
  gem "pry-rails"
  gem "pry-byebug"
  gem "better_errors"
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  #gem 'guard-rspec'
  gem 'launchy'
  gem 'rspec-console'
  gem 'selenium-webdriver'
  gem 'geckodriver-helper'
  #gem 'rails-controller-testing', '~> 1.0', '>= 1.0.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
#gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'devise', '~> 4.3'
gem 'devise-bootstrapped', '~> 0.1.1'
gem 'simple_form'
gem 'jquery-turbolinks', '~> 2.1'
gem 'high_voltage'
gem "sprockets", ">= 3.7.2"
gem "activejob", ">= 5.0.7.1"
gem "rack", ">= 2.0.6"
gem "ffi", ">= 1.9.24"
gem "nokogiri", ">= 1.8.2"
gem "rails-html-sanitizer", ">= 1.0.4"
gem "loofah", ">= 2.2.3"
gem 'sassc-rails'
gem 'webpacker', '~> 3.5'
