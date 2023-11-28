class User::NovelsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
    @novel = Novel.new
    @genres = Genre.all
  end

  def show
    @novel = Novel.find(params[:id])
    @genre = @novel.genre
    unless ReadCount.where(created_at: Time.zone.now.all_day).find_by(user_id: current_user.id, novel_id: @novel.id)
      current_user.read_counts.create(novel_id: @novel.id)
    end
    @novel_comment = NovelComment.new
  end

  def index
    @novels = Novel.all
                   .order(created_at: :desc) #新規投稿順で表示
                   .page(params[:page]).per(10) #ページネーション
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id
    if @novel.save
      redirect_to novel_path(@novel), notice: "You have created novel successfully."
    else
      @novels = Novel.all
      render 'index'
    end
  end

  def edit
    @novel = Novel.find(params[:id])
    @genres = Genre.all # @genresの値を再度セットする
  end

  def update
    if @novel.update(novel_params)
      redirect_to novel_path(@novel), notice: "You have updated novel successfully."
    else
      render "edit"
    end
  end

  def destroy
    @novel.destroy
    redirect_to novels_path
  end

  private

  def novel_params
    params.require(:novel).permit(:title,:body, :genre_id)
  end

  def ensure_correct_user
    @novel = Novel.find(params[:id])
    unless @novel.user == current_user
      redirect_to novels_path
    end
  end
  
end
