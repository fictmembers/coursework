class CashiersController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :index, :edit, :update, :destory]
  def new
    @cashier = Cashier.new
  end

  def index
    @cashiers = Cashier.where(lang:I18n.locale)
  end

  def create
    @cashier = Cashier.new(cashier_params)
    @cashier.save
    redirect_to cashiers_path
  end

  def show
    @cashier = Cashier.find(params[:id])
    @restaurant = Restaurant.find(@cashier.restaurant_id)
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
    params.require(:cashier).permit(:lastname, :restaurant_id)
  end
end
