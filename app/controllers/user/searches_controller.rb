class User::SearchesController < ApplicationController
  
  before_action :authenticate_user!
  
  #投稿・ユーザーの検索機能
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method)
    else
      @records = Novel.search_for(@content, @method)
    end
  end

  
end
