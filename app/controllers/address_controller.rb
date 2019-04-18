class AddressController < ApplicationController
  skip_before_action :delete_user
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

end
