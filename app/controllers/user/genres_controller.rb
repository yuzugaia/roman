class User::GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

end
