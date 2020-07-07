require 'coingecko_client'

RSpec.describe CoingeckoClient do

  before(:each){ 
    @currency = 'usd'
    @coin = 'ethereum'
  }

  it "has a version number" do
    expect(CoingeckoClient::VERSION).not_to be nil
  end

  it "reaches Coingecko" do
    expect(CoingeckoClient::Client.ping).to eq(
      "gecko_says" => "(V3) To the Moon!"
    )
  end

  it "gets the current price of valid coin" do
    expect(CoingeckoClient::Client.price(@coin,@currency)).to be_a(Numeric)
  end

  it "gets nil if invalid coin" do
    expect(CoingeckoClient::Client.price('a',@currency)).to be_nil
  end

  it "gets nil if invalid currency" do
    expect(CoingeckoClient::Client.price(@coin,'a')).to be_nil
  end

  it "gets token value" do
    addr = '0xf1290473e210b2108a85237fbcd7b6eb42cc654f'
    token_price = CoingeckoClient::Client.token_price(@coin,addr,@currency)
    
    expect(token_price).to have_key(addr)
    expect(token_price[addr]).to have_key(@currency)
    expect(token_price[addr][@currency]).to be_a(Numeric)

  end


  it "get history of coin" do 
    coin_history = CoingeckoClient::Client.coin_history(@coin,@currency,'1')
    expect(coin_history).to have_key('prices')
    expect(coin_history['prices'].first.count).to eq 2

    expect(coin_history).to have_key('market_caps')
    expect(coin_history['market_caps'].first.count).to eq 2

    expect(coin_history).to have_key('total_volumes')
    expect(coin_history['total_volumes'].first.count).to eq 2
  
  end

  it "get exchanges list info" do
    exchange_info =  CoingeckoClient::Client.list_exchanges('1','1')
    expect(exchange_info.count).to eq 1
    expect(exchange_info.first).to have_key('id')
    expect(exchange_info.first).to have_key('name')
    expect(exchange_info.first).to have_key('country')
    expect(exchange_info.first).to have_key('trust_score')
  end

  it "get market data of given coins" do
    market_data = CoingeckoClient::Client.coins_market(ids_list:['bitcoin','ethereum'] )
    expect(market_data.count).to eq 2
  end


end
