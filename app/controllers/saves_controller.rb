class SavesController < ApplicationController

  def create
    Save.create(last_level: session[:current_page], user_id: session[:user_id])
    redirect_to session[:current_page]
  end

  def load
    p Save.find_by(user_id: session[:user_id])
  end

end
