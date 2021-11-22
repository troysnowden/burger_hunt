class GameController < ApplicationController
  def index
  end

  def home
    @name = session[:user_name]
  end

  def page3
    session[:puzzle_attempts] = 0 unless session[:puzzle_answer]
    @puzzle_text = "Puzzle Text"
    @puzzle_answer = session[:puzzle_answer] = "[puzzle-answer]"
    if session[:correct_answer_found]
      @correct_answer_found = true
    end
    if session[:puzzle_attempts] == 3
      # add flash message here
    end
  end

  def puzzle_check
    if params[:puzzle_answer_input] == session[:puzzle_answer]
      session[:puzzle_answer] = nil
      # flash message to say correct answer maybe?
      session[:correct_answer_found] = true
      edirect_to "/game/page3"
    else
      session[:correct_answer_found] = nil
      session[:puzzle_attempts] += 1
      redirect_to "/game/page3"
    end
  end


end
