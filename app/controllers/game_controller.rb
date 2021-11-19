class GameController < ApplicationController
  def index
  end

  def register
    @user = User.new
  end

  def register_name
    session[:user_name] = params[:name]
    redirect_to "/game/home"
  end

  def home
    @name = session[:user_name]
  end


end
