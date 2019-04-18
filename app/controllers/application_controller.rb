class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :set_category




  private

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:lastname,:firstname,:lastnamekana,:firstnamekana,:birthyear,:birthmonth,:birthday,:user_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_search
    @search = Item.ransack(params[:q])
    @items = @search.result.limit(4).order("created_at DESC")
  end

  def set_category
    @categories_small ||= Category.new
    @categories_medium ||= Category.new
    @categories_large ||= Category.new
    @categories = Category.all
    @categories_small = []
    @categories_medium = []
    @categories_large = []
    @categories.each do |category|
      if category.parent_id == 14 || category.parent_id == 15 || category.parent_id == 28 || category.parent_id == 29
        @categories_small << category
      elsif category.parent_id == 1 || category.parent_id == 2
        @categories_medium << category
      else
        @categories_large << category
      end
    end
  end
end

