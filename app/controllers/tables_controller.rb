class TablesController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :edit, :update, :destory]

  def new
    @table = Table.new
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

    session.delete(:table)
    session[:table] = @table.id

    @hall = Hall.find(@table.hall_id)
    @hostess = Hostess.where('hall_id = ? and lang = ?', @hall.id, I18n.locale)
    @restaurant = Restaurant.find(@hall.restaurant_id)
    @today = Reservation.where('reserv_time = ? and table_id = ?', Date.today.to_s, @table.id)
    @tommorow = Reservation.where('reserv_time = ? and table_id = ?', Date.current.tomorrow.to_s, @table.id)
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
