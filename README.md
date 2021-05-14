# CoingeckoClient

This is my first gem and the idea was to develop a super simple and lightweight client to connect with Coingecko API.
Keep in mind that this is by no means the oficial gem from Coingecko, it is a pet project that I have interest in keeping it working!
I published it with the methods that I need for another project, but I'll keep on adding more methods to interact with the rest of the API. Any comments, sugestions, Pull Requests, feel free to contact me.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coingecko_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install coingecko_client

## Usage

The available methods are:


* Check if API is up:
```
2.7.0 :026 > CoingeckoClient::Client.ping
 => {"gecko_says"=>"(V3) To the Moon!"}
```

* List coins

List all supported coins id, name and symbol (no pagination required)

```
2.7.0 :027 > list=CoingeckoClient::Client.coins_list
2.7.0 :028 > list.count
 => 7631
2.7.0 :029 > list.first
 => {"id"=>"01coin", "symbol"=>"zoc", "name"=>"01coin"}
```
* Supported_vs_currencies<br>

Get list of supported_vs_currencies.
```
2.7.0 :002 > list = CoingeckoClient::Client.supported_vs_currencies
2.7.0 :003 > list.count
 => 55
2.7.0 :004 > list.first
 => "btc"
```

* Current price <br>
Get the current price of any cryptocurrencies in any other supported currencies that you need.
```
CoingeckoClient::Client.price(<coin>,<currency>)
```
For example:
```
2.7.0 :016 > CoingeckoClient::Client.price('bitcoin','usd')
 => 9246.4
```

* Historical market data
To get the historical market data(price, market cap and trade volume) of a given coin, you would use:<br>
<sub><strong>
Coingecko's note about this API call: Minutely data will be used for duration within 1 day, Hourly data will be used for duration between 1 day and 90 days, Daily data will be used for duration above 90 days.
    </sub></strong>

```
CoingeckoClient::Client.coin_history(<coin>,<currency>,<number_of_days>)
```
For example:
```
CoingeckoClient::Client.coin_history('bitcoin','usd','7')
 => {"prices"=>[[1593511281310, 9161.947854845832], ..., [1594113061000, 9247.986673179646]], market_caps"=>[[1593511281310, 168752424140.90503], ..., [...,...]], , "total_volumes"=>[[...]]}
```

* Market data from coins: <br>
Use this to obtain all the coins market data (price, market cap, volume)

```
2.7.0 :019 > CoingeckoClient::Client.coins_market(currency: 'usd',ids_list:['maker'], price_change_percentage:'7d' )
=> [{"id"=>"maker", "symbol"=>"mkr", "name"=>"Maker", "image"=>"https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826", "current_price"=>465.65, "market_cap"=>419598650, "market_cap_rank"=>30, "total_volume"=>11790566, "high_24h"=>487.76, "low_24h"=>464.65, "price_change_24h"=>-3.61639711, "price_change_percentage_24h"=>-0.77064, "market_cap_change_24h"=>-3408068.16243178, "market_cap_change_percentage_24h"=>-0.80568, "circulating_supply"=>902019.8121058022, "total_supply"=>1005576.0, "ath"=>1798.7, "ath_change_percentage"=>-74.14012, "ath_date"=>"2018-01-20T00:00:00.000Z", "atl"=>168.36, "atl_change_percentage"=>176.28269, "atl_date"=>"2020-03-16T20:52:36.527Z", "roi"=>nil, "last_updated"=>"2020-07-07T09:33:19.687Z", "price_change_percentage_7d_in_currency"=>2.802621306390991}]
```

* List exchanges <br>
List all exchanges <br>
<sub>Default value:: 100</sub>
```
2.7.0 :030 > list=CoingeckoClient::Client.list_exchanges
2.7.0 :031 > list.count
 => 100
2.7.0 :032 > list.first
 => {"id"=>"binance", "name"=>"Binance", "year_established"=>2017, "country"=>"Cayman Islands", "description"=>"", "url"=>"https://www.binance.com/", "image"
=>"https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250", "has_trading_incentive"=>false, "trust_score"=>10, "trust_score_rank"=>1, "t
rade_volume_24h_btc"=>202207.8584274921, "trade_volume_24h_btc_normalized"=>202207.8584274921}
```

* Trending coins <br>
List the Top 7 trending coins
```
2.7.0 :005> CoingeckoClient::Client.coins_trending
=> {"coins"=>[{"item"=>{"id"=>"matic-network", "coin_id"=>4713, "name"=>"Polygon", "symbol"=>"MATIC", "market_cap_rank"=>22, "thumb"=>"https://assets.coingecko.com/coins/images/4713/thumb/matic___polygon.jpg?1612939050", "small"=>"https://assets.coingecko.com/coins/images/4713/small/matic___polygon.jpg?1612939050", "large"=>"https://assets.coingecko.com/coins/images/4713/large/matic___polygon.jpg?1612939050", "slug"=>"polygon", "price_btc"=>2.8814566254115035e-05, "score"=>0}}
```

* Global data <br>
Get global data on cryptocurrencies such as total market cap, trading volume and available markets
```
2.7.0 :006> CoingeckoClient::Client.global
=> {"data"=>{"active_cryptocurrencies"=>7228, "upcoming_icos"=>0, "ongoing_icos"=>50, "ended_icos"=>3375, "markets"=>614, "total_market_cap"=>{"btc"=>47150877.60201247, "eth"=>590487432.9774164, "ltc"=>7267533831.311713, "bch"=>1813437832.9322438, "bnb"=>3952875587.545117, "eos"=>212410692785.36523, "xrp"=>1711624698868.2542, "xlm"=>3552898157262.8335}}
```

* Global Decentralized Finance(DeFi) data <br>
Get global data on DeFi such as market cap and trading volume
```
2.7.0 :007> CoingeckoClient::Client.global_defi
=> {"data"=>{"defi_market_cap"=>"137457435788.2066091800193351248", "eth_market_cap"=>"471137550162.7690872337739426092", "defi_to_eth_ratio"=>"29.1756485427064075772610878798993912180217281909005711205424453", "trading_volume_24h"=>"17340967982.36497960812229859576", "defi_dominance"=>"5.7334520883902335884692023116692586282802032110498494559675484", "top_coin_name"=>"Uniswap", "top_coin_defi_dominance"=>14.895455912137919}}
```

* BTC exchange rates <br>
Get BTC exchange rate value against various currencies including FIAT, gold/silver and other coins
```
irb(main):009:0> CoingeckoClient::Client.btc_to_currency
=> {"rates"=>{"btc"=>{"name"=>"Bitcoin", "unit"=>"BTC", "value"=>1.0, "type"=>"crypto"}, "eth"=>{"name"=>"Ether", "unit"=>"ETH", "value"=>12.405, "type"=>"crypto"}, "ltc"=>{"name"=>"Litecoin", "unit"=>"LTC", "value"=>152.56, "type"=>"crypto"}, "bch"=>{"name"=>"Bitcoin Cash", "unit"=>"BCH", "value"=>37.964, "type"=>"crypto"}, "bnb"=>{"name"=>"Binance Coin", "unit"=>"BNB", "value"=>83.884, "type"=>"crypto"}, "eos"=>{"name"=>"EOS", "unit"=>"EOS", "value"=>4481.84, "type"=>"crypto"}, "xrp"=>{"name"=>"XRP", "unit"=>"XRP", "value"=>36155.406, "type"=>"crypto"}
```

* Status Updates <br>
List status updates from exchanges and coins, such as software releases and policy changes <br>
Pass project_type 'coin' or 'market' to filter, if project_type is left empty, updates from both coins and markets will be returned
```
2.7.0 :012> CoingeckoClient::Client.status_updates(category: 'software_release', project_type: 'coin')
=> {"status_updates"=>[{"description"=>"The DigiByte team is pleased to release DigiByte v7.17.3! This release resolves the underlying Unit Tests and provides a solid foundation for the upcoming version 8 release. No fork / consensus cha
nges here. Upgrading 100% optional.\r\n\r\nhttps://github.com/DigiByte-Core/digibyte/releases/tag/v7.17.3", "category"=>"software_release", "created_at"=>"2021-05-13T05:48:18.366Z", "user"=>"Murat Akyurt", "user_title"=>"DGBAT Outreach O
fficer", "pin"=>false, "project"=>{"type"=>"Coin", "id"=>"digibyte", "name"=>"DigiByte", "symbol"=>"dgb", "image"=>{"thumb"=>"https://assets.coingecko.com/coins/images/63/thumb/digibyte.png?1547033717", "small"=>"https://assets.coingecko
.com/coins/images/63/small/digibyte.png?1547033717", "large"=>"https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717"}}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Bruck1701/coingecko_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Bruck1701/coingecko_client/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CoingeckoClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Bruck1701/coingecko_client/blob/master/CODE_OF_CONDUCT.md).
