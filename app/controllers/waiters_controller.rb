class WaitersController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :edit, :update, :destory]

  def new
    @waiter = Waiter.new
  end

  def index
    @waiters = Waiter.all
  end

  def create
    @waiter = Waiter.new(waiter_params)
    @waiter.save

    redirect_to waiters_path
  end

  def show
    @waiter = Waiter.find(params[:id])
    @restaurant = Restaurant.find(@waiter.restaurant_id)
  end

  def edit
    @waiter = Waiter.find(params[:id])
  end

  def update
    @waiter = Waiter.find(params[:id])

    if @waiter.update_attributes(waiter_params)
      redirect_to waiters_path
    else
      render 'edit'
    end
  end

  def destroy
    Waiter.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def waiter_params
    params.require(:waiter).permit(:lastname, :restaurant_id)
end
end
