class ReservationsController < ApplicationController
  before_action :signed_in_administrator, only:
          [:edit, :update, :destory]

  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.table_id = session[:table]
    @reservation.customer_id = session[:customer_id]
    if @reservation.save
      session[:reservation_id] = @reservation.id
      redirect_to reservationcomplete_path
    else
      render 'new'
    end
  end

  def completereservation
    clean_useless_session
    @reservation = Reservation.find(session[:reservation_id])
    @table = Table.find(@reservation.table_id)
    @hall = Hall.find(@table.hall_id)
    @restaurant = Restaurant.find(@hall.restaurant_id)
    @customer = Customer.find(session[:customer_id])
  end

  def show
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find_by_sql(["
    SELECT RESTAURANTS.*
      FROM RESTAURANTS
      INNER JOIN TABLES
      ON RESTAURANTS.ID = TABLES.RESTAURANT_ID AND TABLES.id = (
        SELECT TABLES.id
          FROM TABLES
          INNER JOIN RESERVATIONS
          ON TABLES.ID = RESERVATIONS.TABLE_ID AND RESERVATIONS.ID = ?)
    ", @reservation.id])

    @guest = Customer.find(@reservation.customer_id)
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to reservations_path
    else
      render 'edit'
    end
  end

  def destroy
    Reservation.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserv_time, :table_id, :customer_id, :from)
  end
end
