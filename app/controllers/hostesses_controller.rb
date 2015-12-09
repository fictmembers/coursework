class HostessesController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :edit, :update, :destory]

  def new
    @hostess = Hostess.new
  end

  def index
    @hostesses = Hostess.all
  end

  def create
    @hostess = Hostess.new(hostess_params)
    @hostess.save

    redirect_to @hostess
  end

  def show
    @hostess =    Hostess.find(params[:id])
    @restaurant = Restaurant.find(@hostess.restaurant_id)
    @hall =       Hall.find(@hostess.hall_id)
  end

  def edit
    @hostess = Hostess.find(params[:id])
  end

  def update
    @hostess = Hostess.find(params[:id])

    if @hostess.update_attributes(hostess_params)
      redirect_to hostesss_path
    else
      render 'edit'
    end
  end

  def destroy
    Hostess.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def hostess_params
    params.require(:hostess).permit(:lastname, :restaurant_id, :hall_id)
  end
end
