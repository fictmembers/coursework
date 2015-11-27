class ReservationsController < ApplicationController

  def new
  @reservation = Reservation.new()
  end

  def index
  @reservation = Reservation.all
  end

  def create
  @reservation = Reservation.new(reservation_params)
  end

  def show
  @reservation = Reservation.find(params[:id])
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
  params.require(:reservation).permit(:RESERV_TIME)
  end

end
