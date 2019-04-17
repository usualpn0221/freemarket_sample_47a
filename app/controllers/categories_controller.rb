class CategoriesController < ApplicationController
  def index

  end

  def show

  end

  def new
    respond_to do |format|
      format.html
      format.json{@sub_categories =Category.all.where(parent_id: params[:category_id])}
    end
  end
end
