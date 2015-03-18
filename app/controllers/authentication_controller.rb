class AuthenticationController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}"
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Signed Out!"
    redirect_to root_path
  end
end
