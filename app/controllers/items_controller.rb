class ItemsController < ApplicationController


  def index

  end

  def show
    @item = Item.find(2)
    # @item = Item.find(params[:id])
    # .includes(:user)

    @items = Item.new
    @comment = Comment.new
    @items.id = 1
  end

  def new
      @item =Item.new
      @item.images.build
      @item.build_trade

  end

  def create

    @item=Item.create(item_params)
    redirect_to items_path
  end

  private
  def item_params
      params.require(:item).permit(:name, :description,:price,:state,:status,:saler_id,:category_id,:brand_id,:saizu,trade_attributes: [:postage,:region,:shipping_date,:delivery],images_attributes: [:image])

  end
end
