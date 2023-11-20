class User::UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @novels = @user.novels
    @novel = Novel.new
    @today_novel =  @novels.created_today
    @yesterday_novel = @novels.created_yesterday
    @this_week_novel = @novels.created_this_week
    @last_week_novel = @novels.created_last_week
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
  
  def bookmarks 
    @user = User.find(params[:id])
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:novel_id)
    @bookmark_novels = Novel.find(bookmarks)
  end
  
  def search
    @user = User.find(params[:user_id])
    @novels = @user.novels
    @novel = Novel.new
    if params[:created_at] == ""
      @search_novel = "日付を選択してください"
    else
      create_at = params[:created_at]
      @search_novel = @novels.where(['created_at LIKE ? ', "#{create_at}%"]).count
    end
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
