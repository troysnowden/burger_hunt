class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def index
    session[:user_id] = nil
    session[:equipped_item] = nil
    session[:keys_grabbed] = nil
    session[:door_locked] = nil
    session[:incorrect_lock_item_message] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?   
    !current_user.nil?
  end
end
