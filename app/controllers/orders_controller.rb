class OrdersController < ApplicationController

  def new
  @order = Order.new()
  end

  def index
  @order = Order.all
  end

  def create
  @order = Order.new(order_params)
  end

  def show
  @order = Order.find(params[:id])
  end

  def edit
  @order = Order.find(params[:id])
  end

  def update
  @order = Order.find(params[:id])

  if @order.update_attributes(order_params)
    redirect_to orders_path
  else
      render 'edit'
  end
  end

  def destroy
  Order.find(params[:id]).destroy
  redirect_to :back
  end

  private

  def order_params
  params.require(:order).permit()
  end

end
