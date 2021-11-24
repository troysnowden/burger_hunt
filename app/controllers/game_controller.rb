class GameController < ApplicationController
  def page1
    session[:current_page] = request.fullpath
    session[:pocket] = ["Chocolate Bar", "T-Rex Egg"]
    session[:equipped_item] = session[:pocket][0] unless session[:equipped_item]
    session[:incorrect_lock_item_message] = nil
    if session[:keys_grabbed]
      add_to_pocket("Keys")
      @keys_grabbed = true
    end
    import_pocket
  end

  def page2
    session[:current_page] = request.fullpath
    session[:correct_answer_found] = nil
    session[:puzzle_attempts] = 0
    if session[:incorrect_lock_item_message]
      flash.now[:notice] = session[:incorrect_lock_item_message]
    end
    if session[:door_locked]
      @door_locked = true
    end
    import_pocket
  end

  def page3
    session[:current_page] = request.fullpath
    import_pocket
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("What has a head and a tail, but no body or legs?", "coin",
       "Hint! You have a 50/50 chance of getting it right, maybe even the flip of a coin.")
  end

  def page4
    session[:current_page] = request.fullpath
    import_pocket
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("Before Mount Everest was discovered, what was the highest mountain on Earth?", "everest", 
    "Hint! Something or other here")
  end

  def page5
    session[:current_page] = request.fullpath
    import_pocket
    session[:bike_text] = nil
  end

  def page6
    session[:current_page] = request.fullpath
    import_pocket
    if session[:bike_text] == true
      @bike_text_clicked = true
    end
  end

  def page6_bike
    session[:bike_text] = true
    redirect_to '/game/page6'
  end

  def puzzle_check
    if puzzle_input_correct?(params[:puzzle_answer_input], session[:puzzle_answer])
      session[:puzzle_answer] = nil
      # flash message to say correct answer maybe?
      session[:correct_answer_found] = true
    else
      session[:correct_answer_found] = nil
      session[:puzzle_attempts] += 1
    end
    redirect_to session[:current_page]
  end

  def equip_item
    if params["Chocolate Bar"]
      session[:equipped_item] = "Chocolate Bar"
    elsif params["T-Rex Egg"]
      session[:equipped_item] = "T-Rex Egg"
    elsif params["Keys"]
      session[:equipped_item] = "Keys"
    elsif params["Carrot"]
      session[:equipped_item] = "Carrot"
    end
    redirect_to session[:current_page]
  end

  def grab_keys
    session[:keys_grabbed] = true
    redirect_to "/game/page1"
  end

  def lock_door
    p "Hello"
    if session[:equipped_item] != "Keys"
      session[:incorrect_lock_item_message] = "You tried, unsuccessfully, to lock your door with a #{session[:equipped_item]}"
    else
      session[:door_locked] = true
      session[:incorrect_lock_item_message] = nil
    end
    redirect_to "/game/page2"
  end

  private

  def puzzle_input_correct?(input, answer)
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

  def import_pocket
    @pocket = session[:pocket]
    @equipped_item = session[:equipped_item]
  end

  def add_to_pocket(item)
    session[:pocket].push(item) unless session[:pocket].include?(item)
  end

end
