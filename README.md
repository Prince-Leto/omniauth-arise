# Omniauth::Arise

Omniauth strategy for arise at ENSIIE

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'omniauth'
gem 'omniauth-oauth'
gem 'omniauth-arise', git: 'https://github.com/PrinceLeto/omniauth-arise.git'
```

And then execute:

    $ bundle

## Usage

Create a file `/config/initializers/omniauth.rb`. Don't forget to add it to your `.gitignore` file.

```ruby
#/config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :arise, 'your_id', 'your_secret', [your_methods_list] # (ex: ["get_identifiant", "get_nom", ...])
end
```

Add routes into your route file :

```ruby
#/config/routes.rb

Rails.application.routes.draw do
	get '/auth/:provider/callback', to: 'sessions#signin'


	# You can add failure route too : get '/auth/failure'. Omniauth is redirecting to this url when something wrong happend
	# And add a sign out route
end
```

Now you can use omniauth into a session controller

```ruby
	def signin
		infos = request.env['omniauth.auth']['extra']['infos']
		session[:arise_id] = infos["get_identifiant"]

		redirect_to root_url, notice: "Vous êtes connecté"
	end

	def signout
		reset_session

		redirect_to 'https://oauth.iiens.net/?page=logout&url=' + root_url
	end

```

## Nota Bene

In production, you need to add arise certificate to trusted authoritizes.

On Debian do :

Add Arise certificate to `/usr/local/share/ca-certificates`

Run `update-ca-certificates`

## Contributing

1. Fork it ( https://github.com/PrinceLeto/omniauth-arise/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
