class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    attraction.save
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
#    byebug
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    redirect_to attraction_path(attraction)
  end

  def destroy
  end

  private

  def attraction_params(*args)
    params.require(:attraction).permit(args)
  end

end
