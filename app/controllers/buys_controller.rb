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
    buyitem
    if @item.trade_status == 3
      redirect_to buys_index_path
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
