class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :delete_user, if: :user_signed_in?
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

  def delete_user
    @registrations = User.find(current_user.id)
    @registrations.destroy unless Profile.where(user_id: current_user.id).exists? && Phonenumber.where(user_id: current_user.id).exists?

  end
end

