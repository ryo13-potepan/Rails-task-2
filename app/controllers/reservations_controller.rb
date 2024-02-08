class ReservationsController < ApplicationController
  def new
    @reservation = @room.reservations.build
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    if @reservation.save
      flash[:notice] = "予約を確定しました"
    redirect_to reservation_path(@reservation.id)
    else
      render template: "rooms/show"
    end
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room.id)
    @progressday = (@reservation.check_out_date - @reservation.check_in_date).to_i
    @total_price = @room.price * @reservation.num_of_people * @progressday
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :num_of_people, :room_id, :total_price)
  end
end
