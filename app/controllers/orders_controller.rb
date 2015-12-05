class OrdersController < ApplicationController

  def new
  @order = Order.new()
  end

  def index
  @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_path
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
  params.require(:order).permit(:restaurant_id, :bill_id, :customer_id, :waiter_id, :manager_id, :chef_id,{:item_ids => []})
  end

end
