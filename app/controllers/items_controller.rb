class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :show, :update]

# before_validation :processing_images, only: [:update, :create]/

  def index
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
      # @item.images.build
      @item.build_trade
  end

  def create

    # images = {}
    # i = 0
    # item_params[:images].each do |image|
    #   i += 1
    #   images[i] = image.original_filename.force_encoding("UTF-8")
    # end

    # images = images.to_a

    # @item = Item.new(name: item_params[:name],
    #  description: item_params[:description],
    #  price: item_params[:price],
    #  item_condition: item_params[:item_condition],
    #  trade_status: item_params[:trade_status],
    #  user_id: 1,
    #  category_id: item_params[:category_id],
    #  brand_id: item_params[:brand_id],
    #  saizu: item_params[:saizu],
    #  images: images.to_json,
    #  trade_attributes:[postage: item_params[:postage],
    #   region: item_params[:region],
    #   shipping_date: item_params[:shipping_date],
    #   delivery: item_params[:delivery]])
    @item = Item.create(name: item_params[:name],
     description: item_params[:description],
     price: item_params[:price],
     item_condition: item_params[:item_condition],
     trade_status: item_params[:trade_status],
     user_id: 1,
     category_id: item_params[:category_id],
     brand_id: item_params[:brand_id],
     saizu: item_params[:saizu],
     trade_attributes:[postage: item_params[:postage],
      region: item_params[:region],
      shipping_date: item_params[:shipping_date],
      delivery: item_params[:delivery]])

    item_params[:images].each do [image]
      @image = Image.create(image: image, item_id: @item.id)
    end

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
     {images: []},
     {trade_attributes:[:postage,:region,:shipping_date,:delivery]}).merge(user_id: 1)
    # .merge(user_id: current_user.id)
  end

  # def image_params
  #   params.require(:item).permit(images_attributes: [:id, :name]).marge(user_id: current_user.id)
  # end

  def set_item
    @item = Item.find(params[:id])
  end

end
