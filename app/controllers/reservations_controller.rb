class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    render json: serializer
  end

  def show
    render json: { reservation: @reservation }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: serializer, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:number_tables, :customer_name, :customer_email, :date, :restaurant_id)
  end

  def reservation
    Reservation.find(params[:id])
  end

  def serializer
    ReservationSerializer.new(@reservations).serializable_hash.to_json
  end
end
