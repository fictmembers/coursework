class CustomersController < ApplicationController

  def new
    @customer = Customer.new()
  end

  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    if signed_in?
      redirect_to customers_path
    else
      redirect_to new_order_path
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def restaurant
      @customer = Customer.find(params[:id])
      @order = Order.new()
      @order.save
  end

  def order
      @order = Order.new()
      @customer = Customer.find(params[:id])
      @order.customer_id = @customer.id
      @order.save
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(customer_params)
      redirect_to customers_path
    else
        render 'edit'
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def customer_params
    params.require(:customer).permit(:lastname)
  end

end
