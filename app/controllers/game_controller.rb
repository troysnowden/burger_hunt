class GameController < ApplicationController
  def index
  end

  def home
    @name = session[:user_name]
  end


end
