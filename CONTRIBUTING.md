# Contributor's Guide

## Installation

Install Ruby 2.2.5, probably using rbenv.

Install PostgreSQL, probably using homebrew.

Download the source code:

```sh
git clone git@github.com:data-creative/law-schools-reporter.git
cd law-schools-reporter/
bin/setup # installs package dependencies and preps the database
```

## Setup

Seed the database with schools and employment data.

```sh
bundle exec rake db:seed
```

## Developing

Run interactive development console:

```shell
bin/rails c
```

Serve locally:

```shell
bin/rails s
```

## Testing

Run tests:

```shell
bundle exec rspec spec/
```

## Deploying

Gain access to the `law-school-reporter` heroku application.

Then deploy:

```sh
git checkout master
git pull origin master
git push heroku master
```

Or deploy from a branch:

```sh
git checkout mybranch
git pull origin mybranch
git push heroku mybranch:master
```
