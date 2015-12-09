class HallsController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :edit, :update, :destory]
  def new
    @hall = Hall.new
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
    session.delete(:hall)
    session[:hall] = @hall.id
    @restaurant = Restaurant.find(session[:restaurant])
    @tables = Table.where('hall_id = ?', params[:id])
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
