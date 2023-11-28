class User::BookmarksController < ApplicationController
  before_action :authenticate_user!

  #ブックマーク(いいね)機能
  def create
    @novel = Novel.find(params[:novel_id])
    bookmark = @novel.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @novel = Novel.find(params[:novel_id])
    bookmark = current_user.bookmarks.find_by(novel_id: @novel.id)
    bookmark.destroy
  end

end