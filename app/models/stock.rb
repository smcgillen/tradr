# == Schema Information
#
# Table name: stocks
#
#  id             :integer          not null, primary key
#  symbol         :string(255)
#  shares         :integer
#  purchase_price :decimal(, )
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Stock < ActiveRecord::Base
  attr_accessible :symbol, :shares, :purchase_price
  belongs_to :user, :inverse_of => :stocks

  before_save :upcase_symbol, :get_purchase_price

  def upcase_symbol
    self.symbol = self.symbol.upcase
  end

  def get_purchase_price
    self.purchase_price = Stock.quote(self.symbol)
  end
  def Stock.historical(symbol)
    symbol = symbol.upcase
    data = YahooFinance::get_historical_quotes_days( symbol.upcase, 30 )
    ends = []
    data.each { |n| ends.push({price: n[2], date: n[1]}) }
    ends
  end


  def Stock.quote(symbol)
    symbol = symbol.upcase
    YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].lastTrade
  end
end