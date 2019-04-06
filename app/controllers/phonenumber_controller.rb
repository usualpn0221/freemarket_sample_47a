class PhonenumberController < ApplicationController
  before_action :quit_registrations, except: [:new,:create]
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

  def quit_registrations
  redirect_to controller: 'users', action: 'destroy', id: current_user.id
  end

  def phonenumber_params
    params.require(:phonenumber).permit(:phonenumber).merge(user_id: current_user.id)
  end
end
