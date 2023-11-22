class Admin::NovelCommentsController < ApplicationController

  def index
    @comments = NovelComment.all
    @users = User.all
  end

  def destroy
    @comment = NovelComment.find(params[:id])
    @comment.destroy
    redirect_to admin_novel_comments_path
  end
  
end
