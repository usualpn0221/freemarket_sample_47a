class ItemsController < ApplicationController
  def new

  end

  def create
    @item=Item.create(name: item_params[:name],description: item_params[:description],price:item_params[:price],condition:item_params[:condition],postage:item_params[:postage],region:item_params[:region],shipping_date:item_params[:shipping_date],saler_id:"1")
    Image.create(image:item_params[:image],item_id: @item.id)
    redirect_to "/items"
  end

  private
  def item_params
      params.permit(:image,:name, :description,:price,:condition,:postage,:region,:shipping_date)
  end
end
