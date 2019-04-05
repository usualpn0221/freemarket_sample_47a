class PhonenumberController < ApplicationController
  before_action :quit_registrations, except: [:new,:create]
  def new
    @profiles=Profile.new
  end

  def create
    @profiles = Profile.new(profile_params[:phonenumber])
    if @profiles.save
      render credit_user_profiles_path
    else
      render :new
    end
  end
end


private
  def quit_registrations
    cuerrent_user.destroy
  end

  def profile_params
    params.permit(:phonenumber).merge(user_id: params[:user_id])
  end
