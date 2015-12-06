class HallsController < ApplicationController

  def new
    @hall = Hall.new()
  end

  def index
    @halls = Hall.all
  end

  def create
    @hall = Hall.new(hall_params)
    @hall.save

    redirect_to halls_path
  end

  def show
    @hall = Hall.find(params[:id])
    @restaurant = Restaurant.find(@hall.restaurant_id)
  end

  def edit
    @hall = Hall.find(params[:id])
  end

  def update
    @hall = Hall.find(params[:id])

    if @hall.update_attributes(hall_params)
      redirect_to halls_path
    else
        render 'edit'
    end
  end

  def destroy
    Hall.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def hall_params
    params.require(:hall).permit(:hall_type, :restaurant_id)
  end

end
