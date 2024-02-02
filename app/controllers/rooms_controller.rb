class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
  @room = Room.find(params[:id])
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

  def search
  end
end
