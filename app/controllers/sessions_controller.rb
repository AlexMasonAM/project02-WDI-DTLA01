class SessionsController < ApplicationController

  def new
  end

  def create
    u = User.find_by(username: params[:unicorn][:username])

    if u && u.authenticate(params[:unicorn][:password])
      session[:user_id] = u.id.to_s #guarnatees session[:user_id] will always be a string of the user's id
      redirect_to properties_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
