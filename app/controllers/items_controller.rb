class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :show, :update]

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
      @item.images.build
      @item.build_trade
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html
        format.json {render json: @item}
      end
    else
      render :new
    end
# binding.pry
#     @item = Item.new(item_params)
#     if @item.save
#       # if @image = @item.images
#       @images = @item.images.create!(name: image)
#       end
# # binding.pry
#       redirect_to root_path
#     else
#       render :new
#     end
  end

  def edit

  end

  # def update
  #   if item.user.id == current_user.id
  #     if item.update(item_params)
  #       if item.images.present?
  #         binding.pry
  #         image_params[:images_attributes]["0"][:image].each_with_index do |image, i|
  #           item.images.update(image: image)
  #           puts i
  #         end
  #         redirect_to item_path(item)
  #       else
  #         render action: :edit
  #       end
  #     else
  #       render action: :edit
  #     end
  #   end
  # end


  def update
    @image = Image.new
    binding.pry
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
    params.require(:item).permit(
     :name,
     :description,
     :price,
     :item_condition,
     :trade_status,
     :user_id,
     :category_id,
     :brand_id,
     :saizu,
     {images_attributes:[:image]},
     {trades_attributes:[:postage,:region,:shipping_date,:delivery]}).merge(user_id: 1)
    # .merge(user_id: current_user.id)
  end

  # def image_params
  #   params.require(:item).permit(images_attributes: [:id, :name]).marge(user_id: current_user.id)
  # end

  def set_item
    @item = Item.find(params[:id])
  end
end
