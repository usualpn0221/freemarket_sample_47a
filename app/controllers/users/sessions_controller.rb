# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
    # Recaptcha.api_key =
    # RECAPTCHA_SECRET_KEY
    # @secret_key = ENV['RECAPTCHA_SECRET_KEY']
    # (@secret_key)
    if verify_recaptcha
      super
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end
  # def create
  #   super

  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # private

  # def check_captcha
  #   verify_recaptcha(model: @user)
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
