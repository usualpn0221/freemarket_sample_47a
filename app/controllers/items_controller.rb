class ItemsController < ApplicationController


  def show
    @comment = Comment.new
  end
end
