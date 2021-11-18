class ArticlesController < ApplicationController
  def index
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
