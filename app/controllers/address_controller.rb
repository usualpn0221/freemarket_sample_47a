class AddressController < ApplicationController
  skip_before_action :delete_user
  before_action :move_to_root,unless: :user_signed_in?
  def new
    @profiles=Profile.new
  end

  def create
    @profiles=Profile.new(profile_params)
    if @profiles.save
      redirect_to new_creditcard_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:postnumber,:banchi,:prefecture,:phonenumber,:shikuchouson,:tatemonomei,:lastname,:firstname,:lastnamekana,:firstnamekana).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path
  end

end
