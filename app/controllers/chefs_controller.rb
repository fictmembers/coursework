class ChefsController < ApplicationController

  def new
  @chef = Chef.new()
  end

  def index
  @chef = Chef.all
  end

  def create
  @chef = Chef.new(chef_params)
  end

  def show
  @chef = Chef.find(params[:id])
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
  params.require(:chef).permit(:LASTNAME)
  end

end
