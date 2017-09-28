# Process Documentation

## Prerequisites

Install rails prerequisites:

```shell
rbenv install 2.2.5
rbenv global 2.2.5
```

```shell
gem list
gem install bundler
gem install rails
```


## Generating

Generate a new rails app:

```shell
rails new law_school_reporter --database=postgresql
cd law_school_reporter/
```


## Version Control

Initialize a new git repo:

```shell
git init .
git add .
git commit -m "Generate new rails app."
# go to github and create a new remote repo: data-creative/law-schools-reporter
git remote add origin git@github.com:data-creative/law-schools-reporter.git
git pull origin master --allow-unrelated-histories
git push origin master
```


## License



Add license:

```shell
touch LICENSE.md
atom LICENSE.md
```

    # License

    Copyright 2017 MJ Rossetti <datacreativellc@gmail.com>.

    This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.


```shell
git add .
git commit -m "Add license"
```




## Gems

Revise `Gemfile`:

```rb
# ...
ruby "2.2.5"

# ...

gem 'yard', group: :doc # run `bundle exec yard doc` to parse comments and/or `bundle exec yard server` to view documentation at *localhost:8808*

# ...

group :development, :test do
  # ...
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem "factory_girl_rails"
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end
```

```shell
bundle install
```

## Documentation


Configure documentation:

```shell
bundle exec yard doc
touch .yardoc/.gitignore
touch doc/.gitignore
```

Add to each of `.yardoc/.gitignore` and `doc/.gitignore`:

    *
    !.gitignore


```shell
git add .
git commit -m "Add docs"
```

## Tests

```shell
rm -rf test/
```

```shell
bundle exec rails generate rspec:install
mkdir spec/support
touch spec/support/factory_girl.rb
```

Revise `spec/rails_helper.rb`:

    # ...

    # Add additional requires below this line. Rails is not loaded until this point!
    require 'support/factory_girl'

    # ...

    # RSpec.configure do |config|

    # ...

      # Configure Shoulda Matchers
      Shoulda::Matchers.configure do |config|
        config.integrate do |with|
          with.test_framework :rspec

          with.library :rails
        end
      end

    # ...


Add to `application/config.rb`:

    # ...

    config.generators do |g|
      g.test_framework :rspec
      g.assets = false
      g.helper = false
    end

    # ...


```shell
bundle exec rspec spec/
```

```shell
git add .
git commit -m "Add test suite"
```








## Local Databases


Create local databases:

```shell
bundle exec rake db:create
```

## Domain-specific Development

```shell
rails g model school uuid:integer:uniq long_name:string name:string year_founded:integer url:string reports_url:string

rails g model employment_report school_name:string year:integer total_grads:integer findings:text
```

```shell
rails g job report_seeder
rails g job school_seeder
```

## Deploying

```shell
heroku apps:create law-school-reporter
```

## API Development

```shell
rails g scaffold_controller api/v1/school # amazing
```
