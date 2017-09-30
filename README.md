# Law Schools Reporter

## Installation

Install Ruby 2.2.5, probably using rbenv.

Install PostgreSQL, probably using homebrew.

Download the source code:

```sh
git clone git@github.com:data-creative/law-schools-reporter.git
cd law-schools-reporter/
bin/setup # installs package dependencies and preps the database
```

## Usage

Seed the database with schools and employment data.

```sh
bundle exec rake db:seed
```

## Developing

Serve locally:

```shell
rails s
```

Run tests:

```shell
bundle exec rspec spec/
```

## Deploying

Gain access to the `law-school-reporter` heroku application. Then deploy:

```sh
git push heroku master # or ...
git push heroku mybranch:master
```

## [License](/LICENSE.md)
