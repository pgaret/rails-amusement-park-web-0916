class RidesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    
    @user, @attraction = User.find(current_user), Attraction.find(params[:id].keys.first)
    ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
