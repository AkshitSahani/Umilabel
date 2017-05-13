class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_profile_path, :notice => "Logged in!"
    else
      flash.now[:alert] = "invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to campaigns_url, notice: "Logged out!"
  end

end
