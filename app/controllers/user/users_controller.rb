class User::UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @novels = @user.novels
    @novel = Novel.new
  end

  def index
    @users = User.all
    @novel = Novel.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def search
    @user = User.find(params[:user_id])
    @novels = @user.novels
    @novel = novel.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
