class StaticPagesController < ApplicationController

	require 'open-uri'

  def home
  	json_now = JSON.parse(open("https://api.coindesk.com/v1/bpi/currentprice.json").read)
  	@price_now = json_now['bpi']['USD']['rate'].delete(',').to_f
  	
  	@start_date = Date.today-1.year
  	end_date = @start_date + 1.day
  	
  	json_year_ago = JSON.parse(open("https://api.coindesk.com/v1/bpi/historical/close.json?start=#{@start_date}&end=#{end_date}").read)
  	@price_year_ago = json_year_ago['bpi'].first.last

  	@percentage_change = (((@price_now / @price_year_ago)-1)*100).round(1)
  end

  def eth
    @price_now = JSON.parse(open("https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD").read)['USD']
    @start_date = Date.today - 1.year
    @time_year_ago = @start_date.to_time.to_i
    @price_year_ago = JSON.parse(open("https://min-api.cryptocompare.com/data/pricehistorical?fsym=ETH&tsyms=USD&ts=1492902000").read)['ETH']['USD']
    @percentage_change = (((@price_now / @price_year_ago)-1)*100).round(1)
  end

  def bch
    @price_now = JSON.parse(open("https://min-api.cryptocompare.com/data/price?fsym=BCH&tsyms=USD").read)['USD']
    @start_date = Date.today-1.year
  end

  def ltc
    @price_now = JSON.parse(open("https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=USD").read)['USD']
    @start_date = Date.today-1.year
  end

end
