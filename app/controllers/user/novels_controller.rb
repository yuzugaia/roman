class User::NovelsController < ApplicationController
  
  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id
    if @novel.save
      if @post.draft?
        redirect_to novels_path, notice: '下書きが保存されました。'
      else
        redirect_to novel_path(@novel), notice: '投稿が公開されました。'
      end
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
    @novel_detail = Novel.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, book_id: @novel_detail.id)
      current_user.view_counts.create(novel_id: @novel_detail.id)
    end
  end
  
  def edit
    @novel = Novel.find(params[:id])
    @user = current_user
  end
  
  def update
    @user = current_user
    @novel = Novel.find(params[:id])

    @novel.assign_attributes(novel_params)
   
    if params[:draft].present?
      @novel.status = :draft
      notice_message = "下書きを保存しました。"
      redirect_path = novels_path
    elsif params[:unpublished].present?
      @novel.status = :unpublished
      notice_message = "非公開にしました。"
      redirect_path = novels_path
    else
      @novel.status = :published
      notice_message = "投稿を更新しました。"
      redirect_path = novels_path(@novel)
    end
    
    if @novel.save
      redirect_to redirect_path, notice: notice_message
    else
      render :edit
    end
  end
  
  def destroy
    novel = Novel.find(params[:id])
    novel.destroy
    redirect_to '/top'
  end
  
  def bookmarks
    @bookmarks = Novel.bookmarks(current_user, params[:page], 10)
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :body, :status)
  end
  
end
