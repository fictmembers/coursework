class TablesController < ApplicationController
  def new
    @table = Table.new()
  end

  def index
    @tables = Table.all
  end

  def create
    @table = Table.new(table_params)
    @table.save

    redirect_to tables_path
  end

  def show
    @table = Table.find(params[:id])
    @waiter = Waiter.find(@table.waiter_id)
    @restaurant = Restaurant.find(@table.restaurant_id)
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])

    if @table.update_attributes(table_params)
      redirect_to tables_path
    else
        render 'edit'
    end
  end

  def destroy
    Table.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def table_params
    params.require(:table).permit(:visnumber, :status, :restaurant_id, :waiter_id, :hall_id)
  end
end
