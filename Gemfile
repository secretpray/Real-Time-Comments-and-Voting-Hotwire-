source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
# gem "kredis"
gem "bootsnap", require: false
gem 'devise'
gem "sassc-rails"
gem "image_processing", "~> 1.2"
gem "font-awesome-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  # gem 'pry', '~> 0.13.1'
  # gem 'pry-byebug'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
end
