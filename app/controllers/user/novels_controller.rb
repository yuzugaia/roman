class User::NovelsController < ApplicationController
  
  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id
    if @novel.save
      redirect_to novel_path(@novel)
    else
      render :new
    end
  end

  def index
    @novel = Novel.page(params[:page]).per(10)
  end

  def show
    @novel = Novel.find(params[:id])
    @novel_comment = NovelComment.new
  end

  def destroy
    novel = Novel.find(params[:id])
    novel.destroy
    redirect_to '/top'
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :body)
  end
  
end
