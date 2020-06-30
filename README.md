# CoingeckoClient

This is my first gem and the idea was to develop a super simple and lightweight client to connect with Coingecko API. 
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

Once the gem is installed, you can check the last price of a given coin calling:

```
CoingeckoClient::Client.price('bitcoin','usd')
```

To get the historical market data(price, market cap and trade volume) of a given coin, you would use:
Note from Coingecko about this API call: Minutely data will be used for duration within 1 day, Hourly data will be used for duration between 1 day and 90 days, Daily data will be used for duration above 90 days.
```
CoingeckoClient::Client.coin_history(<coin>,<currency>,<number_of_days>)
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
