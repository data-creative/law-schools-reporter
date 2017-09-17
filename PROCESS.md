# Process Documentation

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



Generate a new rails app:

```shell
rails new law_school_reporter --database=postgresql
cd law_school_reporter/
```




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









Configure documentation and test suites:

```rb
# Gemfile (comment-out non-essential gems and make the following additions additions)
# ...
ruby "2.2.5"
# ...
gem 'yard', group: :doc # run `bundle exec yard doc` to parse comments and/or `bundle exec yard server` to view documentation at *localhost:8808*
# ...
group :development, :test do
  # ...
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
end
```

```shell
bundle install

bundle exec yard doc
touch .yardoc/.gitignore
touch doc/.gitignore
```

    *
    !.gitignore


```shell
git add .
git commit -m "Add docs"

bundle exec rails generate rspec:install
```
