class BuysController < ApplicationController

  def new
    buyitem
    @trade=@item.trade
  end

  def create

  end

  def index

  end


  def update

  end

  def pay
    buyitem
    Payjp.api_key = PAYJP_SECRET_KEY
    token = params['payjp-token']
    customer = Payjp::Customer.create(card: token)
    Payjp::Charge.create(currency: 'jpy', amount: @item.price, customer: customer)

    if @item.trade_status == 3

    else
      @item.trade_status = 3
      @item.save
    end
  end

  private

  def itembuy_params
    params.permit(:item_id)
  end

  def buyitem
    @item=Item.find(itembuy_params[:item_id])
  end
end
