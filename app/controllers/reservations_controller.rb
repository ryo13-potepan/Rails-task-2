class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    if @reservation.save
      flash[:notice] = "予約を確定しました"
    redirect_to reservations_path(@reservation.id)
    else
      render template: "rooms/show"
    end
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room.id)
    if @reservation.invalid?
      render 'rooms/show'
    end
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
    params.require(:reservation).permit(:check_in_date, :check_out_date, :num_of_people, :room_id, :total_price, :progressday).merge(user_id: current_user.id)
  end
end
