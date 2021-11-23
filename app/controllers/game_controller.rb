class GameController < ApplicationController
  def page1
  end

  def page2
    session[:correct_answer_found] = nil
  end

  def page3
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("What has a head and a tail, but no body or legs?", "coin")
  end

  def page4
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("Before Mount Everest was discovered, what was the highest mountain on Earth?", "everest")
  end

  def puzzle_check
    if puzzle_input_correct(params[:puzzle_answer_input], session[:puzzle_answer])
      session[:puzzle_answer] = nil
      # flash message to say correct answer maybe?
      session[:correct_answer_found] = true
    else
      session[:correct_answer_found] = nil
      session[:puzzle_attempts] += 1
    end
    redirect_to "/game/page3"
  end

  private

  def puzzle_input_correct(input, answer)
    input.downcase.include?(answer)
  end

  def setup_puzzle_page(puzzle_text, puzzle_answer)
    session[:puzzle_attempts] = 0 unless session[:puzzle_answer]
    @puzzle_text = puzzle_text
    session[:puzzle_answer] = puzzle_answer
    if session[:correct_answer_found]
      @correct_answer_found = true
    elsif session[:puzzle_attempts] >= 3
      flash.now[:notice] = "Hint! You have a 50/50 chance of getting it right, maybe even the flip of a coin."
    end
    render "game/puzzle_template"
  end


end
