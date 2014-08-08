# Statusbot::Models

Provides the models used by statusbot.me.

## Installation

Add this line to your application's Gemfile:

    gem 'statusbot-models'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install statusbot-models

## Usage

### Rails

To get up and running with rails, you can do the following:

- Run the following commands

        rake railties:install:migrations
        rake db:migrate

- You are now ready to use the models in your code (assuming `database.yml` is populated)

        ModelName.all

### Non-Rails

If you are not using rails, you can get up and running by doing:

- Create `config/database.yml` file.  This uses default activerecord configuration:

        development:
          adapter: sqlite3
          database: db/development.sqlite3
          pool: 5
          timeout: 5000


        development:
          adapter: mysql2
          encoding: utf8
          database: development
          pool: 5
          username: development
          password: password
          socket: /tmp/mysql.sock

- Run migrations for the gem if you haven't done so:

        bundle exec statusbot-models db:migrate

- You are now ready to use this in your code:

        require 'statusbot/models'
        Statusbot::Models.connect

        ModelName.all

## Development

This gem should only contain the models and the associated tests for those models.  To run the tests do:

    bundle exec rake spec

## Contributing

1. Fork it ( https://github.com/ejhayes/statusbot-models/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
