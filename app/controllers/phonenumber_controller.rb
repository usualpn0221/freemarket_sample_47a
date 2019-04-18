class PhonenumberController < ApplicationController
  skip_before_action :delete_user
  before_action :move_to_root,unless: :user_signed_in?
  def new
    @phonenumber=Phonenumber.new
  end

  def create
    @phonenumber = Phonenumber.new(phonenumber_params)
    if @phonenumber.save
      redirect_to new_address_path
    else
      render :new
    end
  end

  private

  def phonenumber_params
    params.require(:phonenumber).permit(:phonenumber).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path
  end
end
