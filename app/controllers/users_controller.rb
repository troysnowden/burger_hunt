class UsersController < ApplicationController
  
  def register
    @user = User.new
  end

  def create
    session[:user_id] = User.create(user_params).id
    redirect_to "/game/page1"
  end

  def login
    @user = User.new
  end

  def authenticate
    redirect_after_login(User.find_by(username: params[:username]))
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  private 

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def redirect_after_login(user)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

end
