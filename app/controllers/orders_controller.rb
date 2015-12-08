class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    clean_session
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.save

    clean_session

    if signed_in?
      redirect_to orders_path
    else
      redirect_to complete_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @restaurant = Restaurant.find(@order.restaurant_id)
    @customer   = Customer.find(@order.customer_id)
    @waiter     = Waiter.find(@order.waiter_id)
    @manager    = Manager.find(@order.manager_id)
    @chef       = Chef.find(@order.chef_id)
    @items = Item.find_by_sql(["
    SELECT ITEMS.*
      FROM ITEMS
      INNER JOIN PARTS
      ON PARTS.ITEM_ID = ITEMS.ID AND PARTS.ORDER_ID = ?
      ", @order.id])
    @cost = 0
    @items.each do |f|
      @cost += f.price
    end
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

  def complete
    clean_session
  end

  private

  def order_params
    params.require(:order).permit(:restaurant_id, :bill_id, :customer_id, :waiter_id, :manager_id, :chef_id, item_ids: [])
  end
end
