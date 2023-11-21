class Admin::NovelCommentsController < ApplicationController
  
  def index
    @novel_comments = NovelComment.all.includes(:novel)
    @users = User.all
  end

  def destroy
    @novel_comment = NovelComment.find(params[:id])
    @novel_comment.destroy
    redirect_to admin_novel_comments_path
  end
  
end
