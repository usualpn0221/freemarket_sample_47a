class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:user).limit(4).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    # if item.user.id == current_user.id
      if item.update(item_params)
        redirect_to item_path(item)
      else
        render :edit
      end
    # else
      # redirect_to item_path(item)
    # end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if user_signed_in? && current_user.id == item.user_id
    redirect_to user_path(item.user_id),method: :delete
  end

  private
  def item_params
      params.require(:item).permit(:name, :description,:price,:item_condition,:trade_status,:user_id,:category_id,:brand_id,:saizu,trade_attributes: [:postage,:region,:shipping_date,:delivery])

  end

  def image_params
  params.require(:item).permit(images_attributes:{image: []})
  end
end
