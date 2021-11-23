class GameController < ApplicationController
  def index

  end

  def page3
    session[:puzzle_attempts] = 0 unless session[:puzzle_answer]
    @puzzle_text = "What has a head and a tail, but no body or legs?"
    session[:puzzle_answer] = "a coin"
    if session[:correct_answer_found]
      @correct_answer_found = true
    end
    if session[:puzzle_attempts] >= 3
      flash.now[:notice] = "Hint! You have a 50/50 chance of getting it right, maybe even the flip of a coin."
    end
  end

  def puzzle_check
    if params[:puzzle_answer_input].downcase == session[:puzzle_answer]
      session[:puzzle_answer] = nil
      # flash message to say correct answer maybe?
      session[:correct_answer_found] = true
      redirect_to "/game/page3"
    else
      session[:correct_answer_found] = nil
      session[:puzzle_attempts] += 1
      redirect_to "/game/page3"
    end
  end


end
