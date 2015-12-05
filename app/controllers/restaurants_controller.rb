class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new()
  end

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if
    @restaurant.save
    redirect_to restaurants_path
    else
      render 'new'
  end
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
    params.require(:restaurant).permit(:name, :address, :tel)
  end

end
