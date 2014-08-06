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

### rails

This is a rails engine and can be installed as such:

    rake railties:install:migrations
    rake db:migrate

If you are not using rails, you can use the models by doing:

    require 'statusbot/models'
    Statusbot::Models.connect

    User.all

If you need to rollback, follow the standar rails conventions.

## Contributing

1. Fork it ( https://github.com/ejhayes/statusbot-models/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
