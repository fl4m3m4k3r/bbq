source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.2', '>= 6.1.2.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'devise'
gem 'mimemagic'

gem 'rails-i18n'
gem 'devise-i18n'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen', '~> 3.3'
end
