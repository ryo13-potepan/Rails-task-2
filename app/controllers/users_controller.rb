class UsersController < ApplicationController
  def new
  end

  def create
  end

  def profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image, :name, :introduction))
      flash[:notice] ="情報を更新しました"
      redirect_to tops_index_path
    else
      flash.now[:notice] ="更新に失敗しました。もう一度入力し直してください"
      render "users/edit"
    end
  end

  def show
    @user = current_user
  end
end
