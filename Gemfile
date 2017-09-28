source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.2.5"

gem 'rails', '~> 5.1.4' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '~> 0.18' # Use postgresql as the database for Active Record
gem 'puma', '~> 3.7' # Use Puma as the app server
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'yard', group: :doc # run `bundle exec yard doc` to parse comments and/or `bundle exec yard server` to view documentation at *localhost:8808*

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'pry'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end
group :test do

  gem 'factory_girl_rails'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'database_cleaner'
end
