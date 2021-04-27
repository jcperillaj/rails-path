class FollowersController < ApplicationController
  before_action :set_follower, only: %i[ show edit update destroy ]

  def index
    @followers = Follower.all
  end

  def show
  end

  def new
    @follower = Follower.new
  end

  def edit
  end

  def create
    @follower = Follower.new(follower_params)
    @follower.follower = current_user
    @follower.save
    redirect_to controller: 'users', action: 'show', id: follower_params[:followed_id]
  end

  def update
    respond_to do |format|
      if @follower.update(follower_params)
        format.html { redirect_to @follower, notice: "Follower was successfully updated." }
        format.json { render :show, status: :ok, location: @follower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @follower.destroy
    redirect_to controller: 'users', action: 'show', id: @follower.followed_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follower_params
      params.require(:follower).permit(:followed_id)
    end
end
