class Admin::NovelCommentsController < ApplicationController

  def destroy
    @comment = NovelComment.find_by(id: params[:id])

    if @comment
      @comment.destroy
      redirect_to admin_user_path(@comment.novel.admin)
    else
      redirect_to admin_user_path, notice: 'コメントが見つかりませんでした。'
    end
    
  end
  
end
