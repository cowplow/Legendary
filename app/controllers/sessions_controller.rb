class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully Logged In"
      redirect_to new_game_path
    else
      flash[:error] = "There was a problem with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Logged Out."
    redirect_to new_game_path
  end
end