class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new()
  end

  def index
    @reservation = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save

    redirect_to @reservation
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
    params.require(:reservation).permit(:reserv_time, :table_id, :customer_id)
  end

end
