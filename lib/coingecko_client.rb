require 'coingecko_client/version'
require 'excon'
require 'json'

module CoingeckoClient
  class Error < StandardError; end

  # This is a simple client to connect to Coingecko
  class Client

    def self.ping
      # Check API server status
      api_call('ping')
    end

    #########   simple API calls #############
    def self.price(coin, currency)
      # Get the current price of any cryptocurrencies in any other supported currencies that you need.
      coin = coin.downcase
      currency = currency.downcase
      result = api_call("simple/price?ids=#{coin}&vs_currencies=#{currency}")
      return nil if result.nil? or !result.any?

      result[coin][currency]
    end

    def self.token_price(platform_id='ethereum',address,currency)
      api_call("simple/token_price/#{platform_id}?contract_addresses=#{address}&vs_currencies=#{currency}")
    end

    def self.supported_vs_currencies
      api_call('simple/supported_vs_currencies')
    end

    ############### coins API calls ################
    def self.list_coins
      api_call('coins/list')
    end

    def self.coins_list
      list_coins
    end

    def self.coins_market(currency: 'usd',
                          ids_list: ['bitcoin'],
                          order: 'market_cap_desc',
                          per_page: 100,
                          page: 1,
                          sparkline: false,
                          price_change_percentage: '')

      ids = ids_list.join('%2C')
      request = "coins/markets?vs_currency=#{currency}&ids=#{ids}"
      request += "&order=#{order}&per_page=#{per_page}&page=#{page}&sparkline=#{sparkline}"
      request += "&price_change_percentage=#{price_change_percentage}" unless price_change_percentage.empty?

      api_call(request)
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
