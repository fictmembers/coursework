class OrdersController < ApplicationController
  before_action :signed_in_administrator, only:
          [:index, :edit, :update, :destory]
  before_action :all_information_grabbed, only:
          [:new]

  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def create
    @reservation = Reservation.find(session[:reservation_id])
    @table = Table.find(@reservation.table_id)
    @customer = Customer.find(@reservation.customer_id)
    @waiter = Waiter.find(@table.waiter.id)
    @restaurant = Restaurant.find(@waiter.restaurant_id)

    @chef = Chef.find_by_sql(["
        SELECT CHEFS.ID, CHEFS.LASTNAME, CHEFS.RESTAURANT_ID,
         ORDERS_PCS
         FROM CHEFS
         INNER JOIN
          (SELECT CHEF_ID,
              COUNT(ID) AS ORDERS_PCS
            FROM ORDERS
            GROUP BY CHEF_ID
            ORDER BY ORDERS_PCS ASC) AS RAITING
            ON CHEFS.ID = RAITING.CHEF_ID AND CHEFS.RESTAURANT_ID = ?
            LIMIT 1;
      ", @restaurant.id])
    @manager = Manager.find_by_sql(["
      SELECT MANAGERS.ID, MANAGERS.LASTNAME, MANAGERS.RESTAURANT_ID,
       ORDERS_PCS
       FROM MANAGERS
       INNER JOIN
        (SELECT MANAGER_ID,
            COUNT(ID) AS ORDERS_PCS
          FROM ORDERS
          GROUP BY MANAGER_ID
          ORDER BY ORDERS_PCS ASC) AS RAITING
          ON MANAGERS.ID = RAITING.MANAGER_ID AND MANAGERS.RESTAURANT_ID = ?
          LIMIT 1;
    ", @restaurant.id])

    @order = Order.new(order_params)

    @order.restaurant_id = @restaurant.id
    @order.customer_id = @customer.id
    @order.waiter_id = @waiter.id
    @order.manager_id = @manager.first.id
    @order.chef_id = @chef.first.id

    @order.save

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
  end

  private

  def order_params
    params.require(:order).permit(:restaurant_id, :bill_id, :customer_id, :waiter_id, :manager_id, :chef_id, item_ids: [])
  end
end
