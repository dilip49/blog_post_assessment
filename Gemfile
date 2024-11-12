# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails', '~> 7.1.2'
gem 'sprockets-rails'

gem 'active_storage_validations'
gem 'aws-sdk-s3', require: false
gem 'bootsnap', require: false
gem 'devise'
gem 'dotenv-rails'
gem 'pundit'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '>= 5.0'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]
gem 'haml-rails', '~> 2.0'

group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'rspec-rails', '~> 7.0.0'
  gem 'rubocop-rails', require: false
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

group :development do
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
end
