# Statusbot::Models [![Build Status](https://travis-ci.org/ejhayes/statusbot-models.svg?branch=master)](https://travis-ci.org/ejhayes/statusbot-models) [![Gem Version](https://badge.fury.io/rb/statusbot-models.svg)](http://badge.fury.io/rb/statusbot-models) [![Code Climate](https://codeclimate.com/github/ejhayes/statusbot-models/badges/gpa.svg)](https://codeclimate.com/github/ejhayes/statusbot-models)

Provides the models used by statusbot.me.

## Installation

Add this line to your application's Gemfile:

    gem 'statusbot-models'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install statusbot-models

## Usage

Before getting started, you must install MySQL.  Once that is installed, you'll need to setup some base stuff.

For development (assuming connection from localhost):

    CREATE USER 'statusbot'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL ON `statusbot`. * TO 'statusbot'@'localhost';
    FLUSH PRIVILEGES;

For test (assuming connection from localhost):

    CREATE USER 'statusbot_test'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL ON `statusbot_test`. * TO 'statusbot_test'@'localhost';
    FLUSH PRIVILEGES;

### Rails

To get up and running with rails, you can do the following:

- Run the following commands

        rake railties:install:migrations
        rake db:migrate

- You are now ready to use the models in your code (assuming `database.yml` is populated)

        ModelName.all

### Non-Rails

If you are not using rails, you can get up and running by doing:

- Create `db/config.yml` file.  This uses default activerecord configuration:

        development:
          adapter: mysql2
          encoding: utf8
          database: statusbot
          pool: 5
          username: statusbot
          password: password
          socket: /tmp/mysql.sock

        test:
          adapter: mysql2
          encoding: utf8
          database: statusbot_test
          pool: 5
          username: statusbot_test
          password: password
          socket: /tmp/mysql.sock

- Run migrations for the gem if you haven't done so:

        # For the test DB
        RAILS_ENV=test bundle exec statusbot-models db:create
        RAILS_ENV=test bundle exec statusbot-models db:migrate


        # For the default development DB
        bundle exec statusbot-models db:create
        bundle exec statusbot-models db:migrate

- You are now ready to use this in your code:

        require 'statusbot/models'
        Statusbot::Models.connect

        ModelName.all

## Development

This gem should only contain the models and the associated tests for those models.  To run the tests do:

    RAILS_ENV=test bundle exec rake spec

## Contributing

1. Fork it ( https://github.com/ejhayes/statusbot-models/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
