source "https://rubygems.org"

gem 'rails', '~> 4.2.9'
gem 'jquery-rails', '~> 4.3.1'
gem 'haml-rails'
gem 'mongoid', require: false

gem 'maestrano', '~> 1.0.6'

group :development, :test do
  gem 'sqlite3', platforms: :ruby
  gem 'activerecord-jdbcsqlite3-adapter', platforms: :jruby
end

group :development, :test do
  gem 'brakeman', require: false
  gem 'simplecov', require: false
end

group :development do
  gem 'jeweler'
end

group :test do
  gem 'test-unit', '~> 3'
  gem 'mocha', '~> 1.3'
  gem 'shoulda', '~> 3.5'
  gem 'activesupport', '~> 4.2'
  gem 'database_cleaner'
end

group :production do
  gem 'pg', platforms: :ruby
  gem 'activerecord-jdbcpostgresql-adapter', platforms: :jruby
end
