class CashiersController < ApplicationController

  def new
  @cashier = Cashier.new()
end

def index
  @cashier = Cashier.all
end

def create
  @cashier = Cashier.new(cashier_params)
end

def show
  @cashier = Cashier.find(params[:id])
end

def edit
  @cashier = Cashier.find(params[:id])
end

def update
  @cashier = Cashier.find(params[:id])

  if @cashier.update_attributes(cashier_params)
    redirect_to cashiers_path
  else
      render 'edit'
  end
end

def destroy
  Cashier.find(params[:id]).destroy
  redirect_to :back
end

private

def cashier_params
  params.require(:cashier).permit(:LASTNAME)
end


end
