class User::GenresController < ApplicationController
  before_action :authenticate_user!
  
  #ジャンル機能
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

end
