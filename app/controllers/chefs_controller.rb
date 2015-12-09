class ChefsController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :edit, :update, :destory]
  def new
    @chef = Chef.new
  end

  def index
    @chefs = Chef.all
  end

  def create
    @chef = Chef.new(chef_params)
    @chef.save

    redirect_to chefs_path
  end

  def show
    @chef = Chef.find(params[:id])
    @restaurant = Restaurant.find(@chef.restaurant_id)
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])

    if @chef.update_attributes(chef_params)
      redirect_to chefs_path
    else
      render 'edit'
    end
  end

  def destroy
    Chef.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def chef_params
    params.require(:chef).permit(:lastname, :restaurant_id)
  end
end
