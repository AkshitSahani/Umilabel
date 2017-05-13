class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    # respond_to do |format|
    #   format.html
    # end
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def new_profile
    @user = User.find(session[:user_id])
  end

  def create_profile
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :new_profile
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :studio_name, :description, :tags, :founded_in, :avatar, :background_image)
  end

  def load_user
    @user = User.find(params[:id])
  end

end
