class ItemsController < ApplicationController

before_action :set_item, except: [:edit, :show]
before_action :set_item_local, except: [:update, :destroy]

  def index
    @items = Item.all.includes(:user).limit(4).order("created_at DESC")
  end

  def show

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

  end

  def update
    # if item.user.id == current_user.id
      if item.update(item_params)
        # if item.images.present?
        #   binding.pry
        #   image_params[:images_attributes]["0"][:image].each_with_index do |image, i|
        #     item.images.update(image: image)
        #     puts i
        #   end
          redirect_to item_path(item)
        # else
        #   render action: :edit
        # end
      else
        render action: :edit
      end
    # end
  end

  def destroy
    item.destroy if user_signed_in? && current_user.id == item.user_id
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:price,:item_condition,:trade_status,:user_id,:category_id,:brand_id,:saizu,trade_attributes: [:postage,:region,:shipping_date,:delivery])
  end

  def image_params
    params.require(:item).permit(images_attributes:{image: []})
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_local
    item = Item.find(params[:id])
  end
end
