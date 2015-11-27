class AdministratorsController < ApplicationController

  def new
  @administrator = Administrator.new()
end

def index
  @administrator = Administrator.all
end

def create
  @administrator = Administrator.new(administrator_params)
end

def show
  @administrator = Administrator.find(params[:id])
end

def edit
  @administrator = Administrator.find(params[:id])
end

def update
  @administrator = Administrator.find(params[:id])

  if @administrator.update_attributes(administrator_params)
    redirect_to administrators_path
  else
      render 'edit'
  end
end

def destroy
  Administrator.find(params[:id]).destroy
  redirect_to :back
end

private

def administrator_params
  params.require(:administrator).permit(:LASTNAME)
end

end
