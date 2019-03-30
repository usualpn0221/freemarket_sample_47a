class ItemsController < ApplicationController



  def show
    @item = Item.find(params[:id]).includes(:saler_id)
    @items = Item.new
    @comment = Comment.new
    @items.id = 1
  end
  def new

  end
end
