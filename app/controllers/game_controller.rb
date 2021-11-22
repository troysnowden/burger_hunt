class GameController < ApplicationController
  def index
  end

  def page_1
    @name = session[:user_name]
  end


end
