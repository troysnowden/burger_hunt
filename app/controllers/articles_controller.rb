class ArticlesController < ApplicationController
  def index
  end

  def room1
    @name = "Dog"
  end

  def room2
    @other_name = "Cat"
  end

  def journey_end

    redirect_to ("/")

  end
end
