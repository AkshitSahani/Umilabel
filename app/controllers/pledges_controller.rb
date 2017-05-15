class PledgesController < ApplicationController

  # def index
  #   #code
  # end

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private
  def pledge_params
    params.require(:pledge).permit(:reward_id, :user_id)
  end

end
