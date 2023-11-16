class User::BookmarksController < ApplicationController
  
  def create
    @novel = novel.find(params[:novel_id])
    favorite = @novel.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @novel = Novel.find(params[:novel_id])
    favorite = current_user.favorites.find_by(novel_id: @novel.id)
    favorite.destroy
  end
  
end