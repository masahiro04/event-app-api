# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'puma', '~> 4.3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'brakeman', '~> 4.7', require: false
  gem 'rails_best_practices', '~> 1.19', require: false
  gem 'rubocop', '~> 0.76', require: false
  gem 'rubocop-rails', '~> 2.3', require: false

  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'better_errors'
  gem 'rails-erd'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

gem 'devise'
gem 'devise_token_auth'
gem 'rack-cors'
gem 'jp_prefecture'
gem 'enumerize'
gem 'rmagick'
gem 'carrierwave'



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
