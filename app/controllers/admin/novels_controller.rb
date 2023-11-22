class Admin::NovelsController < ApplicationController
  
  def index
    @novels = Novel.all
  end
  
  def show
    @novel = Novel.find(params[:id])
  end
  
end
