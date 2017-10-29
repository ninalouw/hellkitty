class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Signed In'
    else
      flash.now[:alert] = 'Wrong Credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have been signed out'
  end
end
