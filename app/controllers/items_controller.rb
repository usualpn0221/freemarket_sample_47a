class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:user).limit(4).order("created_at DESC")
  end


  def show
    # @item = Item.find(2)
    @item = Item.find(params[:id])
    # .includes(:user)

    @items = Item.new
    @comment = Comment.new
    @items.id = 1
  end

  def new
      @item =Item.new
      @image = @item.images.build
      @item.build_trade


  end

  def create
    @item=Item.create(item_params)

    image_params[:images_attributes][:"0"][:image].each do |image|
      @image = @item.images.create(image: image)
    end
    redirect_to items_path
  end

  private
  def item_params
      params.require(:item).permit(:name, :description,:price,:state,:status,:saler_id,:category_id,:brand_id,:saizu,trade_attributes: [:postage,:region,:shipping_date,:delivery])

  end

  def image_params
  params.require(:item).permit(images_attributes:{image: []})
  end
end
