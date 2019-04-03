class BuysController < ApplicationController
  def new
    @item=Item.find(itembuy_params[:item_id])
  end

  def create
    @item=Item.find(itembuy_params[:item_id])
    @item.trade_status = 3
    @item.save
  end

  def index
  end

  private
  def itembuy_params
    params.permit(:item_id)
  end
end
