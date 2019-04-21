class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :show, :update]
before_action :move_to_root,unless: :user_signed_in? ,only: :new


  def index
    @ladies_items = @search.result.set_index(category_id:67..94).limit(4)
    @mens_items = @search.result.set_index(category_id:95..120).limit(4)
    @kids_items = @search.result.set_index(category_id:121..139).limit(4)
    @cosme_items = @search.result.set_index(category_id:140..162).limit(4)
    @channel_items = @search.result.set_index(brand_id:1).limit(4)
    @louis_vuitton_items = @search.result.set_index(brand_id:3).limit(4)
    @supreme_items = @search.result.set_index(brand_id:4).limit(4)
    @nike_items = @search.result.set_index(brand_id:2).limit(4)
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
    if params[:images].present?
      if @item.save
        if image_params.each { |image| @image = @item.images.create(image: image)}
          redirect_to items_path
        else
          render :new
        end
      end
    else
      render :new
    end
  end

  def edit



  end

  def update

    if @item.update(item_params)
      if params[:images].present?
      image_params.each { |image| @image = @item.images.create(image: image)}
        redirect_to item_path(@item)
      else
        redirect_to item_path(@item)
      end
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
    params.require(:item).permit(:name, :description,:price,:item_condition,:trade_status,:user_id,:category_id,:brand_id,:saizu,trade_attributes: [:postage,:region,:shipping_date,:delivery],images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:images).permit(name: [])[:name]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    redirect_to root_path
  end
end
