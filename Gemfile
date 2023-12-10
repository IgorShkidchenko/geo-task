source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'
gem 'bootsnap', require: false
gem 'jsonapi-serializer'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8'

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'vcr', require: false
  gem 'webmock', require: false
end

group :development do
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  gem 'pry'
end
