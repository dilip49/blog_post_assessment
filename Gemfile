# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails', '~> 7.1.2'
gem 'sprockets-rails'

gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '>= 5.0'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
