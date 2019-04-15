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
    customer_id =current_user.cards[0].customer_id
    Payjp::Charge.create(currency: 'jpy', amount: @item.price, customer: customer_id)

    if @item.trade_status == 3
       redirect_to items_path
    else
      @item.trade_status = 3
      @item.save
      @item.trade.buyer_id =current_user.id
      @item.trade.save
      redirect_to items_path
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
