class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def destroy
    user = User.find(params[:id])
    redirect_to user_path(current_user.id),method: :delete
  end
end
