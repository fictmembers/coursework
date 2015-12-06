class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new()
  end

  def index
    session.delete(:table)
    session.delete(:hall)
    session.delete(:restaurant)
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.table_id = session[:table]
    @reservation.save

    redirect_to reservationcomplete_path

  end

  def completereservation
    @table = Table.find(session[:table])
    @hall = Hall.find(session[:hall])
    @restaurant = Restaurant.find(session[:restaurant])

    session.delete(:table)
    session.delete(:hall)
    session.delete(:restaurant)
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
