class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def index
    if logged_in?
      @saved_game = Save.find_by(user_id: session[:user_id])
    end
    session[:equipped_item] = nil
    session[:keys_grabbed] = nil
    session[:door_locked] = nil
    session[:current_page] = "/game/page1"
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?   
    !current_user.nil?
  end
end
