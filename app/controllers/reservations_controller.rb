class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.status = "requested"
    @reservation.save!
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :artwork_id)
  end
end
