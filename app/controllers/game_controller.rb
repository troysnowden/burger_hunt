class GameController < ApplicationController
  def page1
  end

  def page2
    session[:correct_answer_found] = nil
    session[:puzzle_attempts] = 0
  end

  def page3
    session[:current_page] = request.fullpath
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("What has a head and a tail, but no body or legs?", "coin",
       "Hint! You have a 50/50 chance of getting it right, maybe even the flip of a coin.")
  end

  def page4
    session[:current_page] = request.fullpath
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("Before Mount Everest was discovered, what was the highest mountain on Earth?", "everest", 
    "Hint! Something or other here")
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
    redirect_to session[:current_page]
  end

  def page5
    session[:page_6_deadend_visited] = nil
    # This probably needs to be set to nil in page 3 and page 4 instead?
    # otherwise would reset to nil when page 5 was landed on after being at page 6?
    session[:carrot_eaten] = 0
  end




  private

  def puzzle_input_correct(input, answer)
    input.downcase.include?(answer)
  end

  def setup_puzzle_page(puzzle_text, puzzle_answer, hint_text)
    session[:puzzle_attempts] = 0 unless session[:puzzle_answer]
    @puzzle_text = puzzle_text
    session[:puzzle_answer] = puzzle_answer
    if session[:correct_answer_found]
      @correct_answer_found = true
    elsif session[:puzzle_attempts] >= 3
      flash.now[:notice] = hint_text
    end
    render "game/puzzle_template"
  end

  def carrot_eaten
  # Need to click on carrot button / link? 
  # Does it include the pocket? Use carrot?
  end

end
