class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :show, :update]

  def index
    @categories = Category.all
    @items = Item.all.includes(:user).limit(4).order("created_at DESC")
    @search = Item.ransack(params[:q])
    @items = @search.result.limit(4).order("created_at DESC")

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
    @item=Item.new(item_params)
    if @item.save
      if image_params[:images_attributes][:"0"][:image].each { |image| @image = @item.images.create(image: image)}
        redirect_to items_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
        redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if user_signed_in? && current_user.id == item.user_id
    redirect_to user_path(item.user_id)
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

end
