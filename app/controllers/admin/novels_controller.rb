class Admin::NovelsController < ApplicationController
  
  
  
  def index
    @novels = Novel.all
  end
  
end
