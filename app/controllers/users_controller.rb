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
    User.find(params[:id]).destroy
    redirect_to users_path
  end

end
