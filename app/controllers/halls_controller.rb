class HallsController < ApplicationController

  def new
  @hall = Hall.new()
  end

  def index
  @hall = Hall.all
  end

  def create
  @hall = Hall.new(hall_params)
  end

  def show
  @hall = Hall.find(params[:id])
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
  params.require(:hall).permit(:HALL_TYPE, :CAPACITY)
  end

end
