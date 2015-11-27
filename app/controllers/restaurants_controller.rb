class RestaurantsController < ApplicationController

  def new
  @restaurant = Restaurant.new()
  end

  def index
  @restaurant = Restaurant.all
  end

  def create
  @restaurant = Restaurant.new(restaurant_params)
  end

  def show
  @restaurant = Restaurant.find(params[:id])
  end

  def edit
  @restaurant = Restaurant.find(params[:id])
  end

  def update
  @restaurant = Restaurant.find(params[:id])

  if @restaurant.update_attributes(restaurant_params)
    redirect_to restaurants_path
  else
      render 'edit'
  end
  end

  def destroy
  Restaurant.find(params[:id]).destroy
  redirect_to :back
  end

  private

  def restaurant_params
  params.require(:restaurant).permit(:NAME, :ADRESS, :TEL)
  end

end
