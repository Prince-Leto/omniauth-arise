# Omniauth::Arise

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-arise'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-arise

## Usage

Create a file `/config/initializers/omniauth.rb`

```ruby
#/config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :arise, 'your_id', 'your_secret', [your_methods_list (ex: get_identifiant, ...)]
end
```

## Contributing

1. Fork it ( https://github.com/PrinceLeto/omniauth-arise/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
