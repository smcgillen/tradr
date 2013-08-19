class StocksController < ApplicationController
   before_filter :only_authorized

  def index
    @stocks = @auth.stocks
    @stock = Stock.new

  end


  def create
    @auth.stocks.create(params[:stock])
    @stocks = @auth.stocks
  end

  def quotes
    render :json => Stock.historical(params[:symbol])
  end



  private
  def only_authorized
    redirect_to(root_path) if @auth.nil?
  end

end
