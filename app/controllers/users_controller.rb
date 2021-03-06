class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :property_id))

    if @user.save
      redirect_to properties_path
    else
      render :new
    end
  end
end

