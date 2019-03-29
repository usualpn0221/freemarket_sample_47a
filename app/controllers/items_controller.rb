class ItemsController < ApplicationController



  def show
    @items = Item.new
    @comment = Comment.new
    @items.id = 1
  end
  def new

  end
end
