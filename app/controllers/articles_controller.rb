class ArticlesController < ApplicationController
  def index
  end

  def register_name
    session[:user_name] = params[:name]
    redirect_to "/articles/home"
  end

  def home
    @lines = [
      "Hello my name is",
      "Hello my name is",
      "ehlleoeon he"
    ]
  end

  def room1
    @name = "Dog"
  end

  def room2
    @name = "Cat"
  end

  def journey_end

    redirect_to ("/winner")

  end
end
