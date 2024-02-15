class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :image, :address, :user_id))
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_path, notice: '施設が新規登録されました'
    else
      render "new"
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def search
  end

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id, :room_id)
  end
end
