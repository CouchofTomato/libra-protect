# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 7.0.3"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.3"
# Use Puma as the app server
gem "puma", "~> 5.6"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

gem "administrate", github: "n-studio/administrate", branch: "compile-assets"
gem "cssbundling-rails"
gem "devise", "~> 4.8"
gem "devise_invitable", "~> 2.0.0"
gem "inline_svg"
gem "jsbundling-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails", "~> 1.1"
gem "view_component", "~> 2.57"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 6.2"
  gem "rspec-rails", "~> 5.1.2"
  gem "rubocop", "~> 1.30", require: false
  gem "rubocop-performance", "~> 1.14", require: false
  gem "rubocop-rails", "~> 2.14", require: false
  gem "rubocop-rspec", "~> 2.11", require: false
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
  gem "listen", "~> 3.7"
  gem "rack-mini-profiler", "~> 3.0"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  gem "capybara"
  gem "cuprite"
  gem "shoulda-matchers", "~> 5.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
