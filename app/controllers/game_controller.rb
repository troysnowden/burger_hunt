class GameController < ApplicationController
  def index
  end

  def home
    @name = session[:user_name]
  end

  def page3
    @puzzle_text = "Puzzle Text"
    @puzzle_answer = session[:puzzle_answer] = "[puzzle-answer]"
    session[:puzzle_attempts] = 0
  end

  def puzzle_check
    if params[:puzzle_answer] == session[:puzzle_answer]
      redirect_to "/game/page5"
    else
      redirect_to "/game/page3"
    end
  end


end
