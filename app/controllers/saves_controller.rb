class SavesController < ApplicationController

  def create
    Save.find_or_create_by(user_id: session[:user_id]).update_attribute(:last_level, session[:current_page])
    redirect_to session[:current_page]
  end

  def load
    Save.find_by(user_id: session[:user_id])
  end

end
