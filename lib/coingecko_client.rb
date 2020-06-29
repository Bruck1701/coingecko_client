require "coingecko_client/version"
require 'excon'
require 'json'

module CoingeckoClient
  class Error < StandardError; end
    
  # This is a simple client to connect to Coingecko
  class Client
    def self.list_coins
      api_call('coins/list')
    end

    def self.price(coin, currency)
      coin = coin.downcase
      currency = currency.downcase
      result = api_call("simple/price?ids=#{coin}&vs_currencies=#{currency}")
      return nil if result.nil?

      result[coin][currency]

    end

    def self.coin_history(coin,currency,days)
      api_call("coins/#{coin.downcase}/market_chart?vs_currency=#{currency.downcase}&days=#{days}\" -H \"accept: application/json")
    end



    private_class_method def self.api_call(api_request)
      endpoint_head = 'https://api.coingecko.com/api/v3/'
      url = endpoint_head + api_request
      response = Excon.get(url)
      return nil if response.status != 200

      JSON.parse(response.body)
    end
  end
   

end
