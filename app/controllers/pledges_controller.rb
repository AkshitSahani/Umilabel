class PledgesController < ApplicationController
before_action :load_pledge, only: [:show, :edit, :update, :destroy]

  def index
    #code
  end

  def show
    #code
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.save!
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    @pledge.destroy
  end

  private
  def pledge_params
    params.require(:pledge).permit(:reward_id, :user_id, :percentage_pledged)
  end

  def load_pledge
    @pledge = Pledge.find(params[:id])
  end

end
