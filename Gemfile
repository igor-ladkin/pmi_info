source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.2'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'puma'
gem 'active_model_serializers'
gem 'foundation-rails'
gem 'font-awesome-rails'

gem 'rails_12factor' , group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'web-console', '~> 2.0'
  gem 'spring'

  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rails'
  gem 'guard-migrate'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  gem 'guard-rubocop'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'shoulda-matchers' 
  gem 'capybara'  
  gem 'database_cleaner'   
  gem 'launchy'  
  gem 'poltergeist'    
end
