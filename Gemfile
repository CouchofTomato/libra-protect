# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 7.1.3"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5"
# Use Puma as the app server
gem "puma", "~> 6.4"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.12"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.2"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

gem 'acts-as-taggable-on', '~> 10.0'
gem "axlsx_styler", "~> 1.2"
gem "caxlsx", "~> 3.2"
gem "caxlsx_rails", "~> 0.6.4"
gem "cssbundling-rails"
gem "devise", "~> 4.9"
gem "devise_invitable", "~> 2.0.9"
gem "inline_svg"
gem "jsbundling-rails"
gem 'rails_admin', '~> 3.1'
gem "redis-session-store", "~> 0.11.4"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails", "~> 1.5"
gem "view_component", "~> 3.13"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 6.4"
  gem "rspec-rails", "~> 6.1.3"
  gem "rubocop", "~> 1.65", require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem "rubocop-performance", "~> 1.21", require: false
  gem "rubocop-rails", "~> 2.25", require: false
  gem "rubocop-rspec", "~> 3.0", require: false
  gem 'rubocop-rspec_rails', require: false
  gem "simplecov"
  gem "simplecov-html"
  gem "simplecov-lcov"
  gem "undercover"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"

  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.9"
  gem "rack-mini-profiler", "~> 3.3"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  gem "capybara"
  gem "cuprite"
  gem "shoulda-matchers", "~> 6.3"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
