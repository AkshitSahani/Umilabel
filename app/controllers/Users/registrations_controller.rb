class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    $full_name = params['user']['full_name']
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def profile_setup

  end

  def create_profile
    if current_user.update_attributes(sign_up_params)
      redirect_to root_path
    else
      render :profile_setup
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit_profile

  end

  def update_profile
    if current_user.update_attributes(sign_up_params)
      redirect_to user_path(current_user), notice: "Profile Updated Successfully!"
    else
      render :edit_profile
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :studio_name, :description, :tags, :founded_in, :avatar, :background_image])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :studio_name, :description, :tags, :founded_in, :avatar, :background_image])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    profile_setup_path(current_user)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
