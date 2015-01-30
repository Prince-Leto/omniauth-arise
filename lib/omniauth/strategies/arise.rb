require 'digest'
require 'omniauth-oauth'

module OmniAuth
	module Strategies
		class Arise < OmniAuth::Strategies::OAuth
			option :name, "arise"

			args [:consumer_key, :consumer_secret, :consumer_options]

			option :client_options, {
				:site               => 'https://oauth.iiens.net/',
				:authorize_url      => 'https://oauth.iiens.net/authorize.php',
				:request_token_url  => 'https://oauth.iiens.net/initiate.php',
				:access_token_url   => 'https://oauth.iiens.net/token.php',
			}

			uid{ }

			info do
			{

			}
			end

			extra do
			{
				'infos' => raw_info
			}
			end

			def raw_info
				data = '['
				options.consumer_options.each_with_index do |option, i|
					data += '{"jsonrpc": "2.0", "method": "' + option + '", "params": [], "id": ' + (i + 1).to_s + '},'
				end
				data = data[0, data.length - 1] unless data.length == 0
				data += ']'
				@raw_info = {}
				MultiJson.decode(access_token.post("https://oauth.iiens.net/api.php?oauth_api_call_hash=" + Digest::SHA256.hexdigest(data), data, { "Content-Type" => "application/json" }).body).each_with_index do |res, i|
					@raw_info[options.consumer_options[i]] = res["result"]
				end
				@raw_info
			end
		end
	end
end

OmniAuth.config.add_camelization('arise', 'Arise')