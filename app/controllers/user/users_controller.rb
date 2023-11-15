class User::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @novels = @user.books
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
  
end
