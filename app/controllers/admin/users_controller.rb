class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.all
                 .order(created_at: :desc) #新規投稿順
                 .page(params[:page]).per(8) #ページネーション
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "変更しました"
    else
      render 'edit'
    end
  end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "ユーザーを削除しました"
    end

private

  def user_params
    params.require(:user).permit(:name,:is_active)
  end
  
end
