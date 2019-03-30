class ItemsController < ApplicationController


  def index

  end

  def show
    @item = Item.find(params[:id]).includes(:user)

    @items = Item.new
    @comment = Comment.new
    @items.id = 1
  end

  def new
      @item =Item.new
      @item.images.build

  end

  def create
    @item=Item.create(item_params)
    redirect_to items_path
  end

  private
  def item_params
      params.require(:item).permit(:name, :description,:price,:condition,:postage,:region,:shipping_date,:saler_id,images_attributes: [:image])

  end
end
