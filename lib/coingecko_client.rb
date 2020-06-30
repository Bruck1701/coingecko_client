require "coingecko_client/version"
require 'excon'
require 'json'

module CoingeckoClient
  class Error < StandardError; end
    
  # This is a simple client to connect to Coingecko
  class Client

    def self.ping
      api_call('ping')
    end
  

    def self.price(coin, currency)
      coin = coin.downcase
      currency = currency.downcase
      result = api_call("simple/price?ids=#{coin}&vs_currencies=#{currency}")
      return nil if result.nil? or !result.any?

      result[coin][currency]
    end


    def self.token_price(platform_id='ethereum',address,currency)
      api_call("simple/token_price/#{platform_id}?contract_addresses=#{address}&vs_currencies=#{currency}")
    end


    def self.list_coins
        api_call('coins/list')
    end


    def self.coin_history(coin,currency,days)
      api_call("coins/#{coin.downcase}/market_chart?vs_currency=#{currency.downcase}&days=#{days}")
    end

    def self.list_exchanges(per_page=0, page=1)

      if per_page == 0
        api_call("exchanges?page=#{page}")
      else
        api_call("exchanges?per_page=#{per_page}&page=#{page}")
      end
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
