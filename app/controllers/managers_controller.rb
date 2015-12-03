class ManagersController < ApplicationController

  def new
    @manager = Manager.new()
  end

  def index
    @manager = Manager.all
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      sign_in @manager
      redirect_to @manager
    else
      render "new"
    end
  end

  def show
    @manager = Manager.find(params[:id])
    @restaurant = Restaurant.find(@manager.restaurant_id)
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])

    if @manager.update_attributes(manager_params)
      redirect_to managers_path
    else
        render 'edit'
    end
  end

  def destroy
    Manager.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def manager_params
    params.require(:manager).permit(:lastname, :tel, :restaurant_id)
  end

end
