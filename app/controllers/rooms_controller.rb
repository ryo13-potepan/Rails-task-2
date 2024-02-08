class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
  end

  def new
    @room = current_user.rooms.build
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
