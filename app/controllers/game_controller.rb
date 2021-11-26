class GameController < ApplicationController
  def page1
    redirect_to "/" unless logged_in?
    session[:city] = get_city_name unless session[:city]
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
    redirect_to "/" unless logged_in?
    @city_name = session[:city]
    session[:current_page] = request.fullpath
    autosave
    session[:correct_answer_found] = nil
    session[:puzzle_attempts] = 0
    if session[:incorrect_lock_item_message]
      flash.now[:notice] = session[:incorrect_lock_item_message]
    end
    if session[:door_locked]
      @door_locked = true
    end
    import_pocket
    session[:page6_visited] = nil
    session[:carrots_eaten] = 0
  end

  def page3
    redirect_to "/" unless logged_in?
    session[:current_page] = request.fullpath
    autosave
    import_pocket
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("What has a head and a tail, but no body or legs?", "coin",
       "Hint! You have a 50/50 chance of getting it right, maybe even the flip of a coin.")
  end

  def page4
    redirect_to "/" unless logged_in?
    session[:current_page] = request.fullpath
    autosave
    import_pocket
    # Look at adding these riddle messages and answers to a db, and calling a random riddle maybe?
    setup_puzzle_page("Before Mount Everest was discovered, what was the highest mountain on Earth?", "everest", 
    "Hint! Rufus isn't very knowledgeable when it comes to the history of mountaineering conquests, so it must be a trick question")
  end

  def page5
    redirect_to "/" unless logged_in?
    session[:current_page] = request.fullpath
    autosave
    import_pocket
    session[:bike_text] = nil
    if session[:page6_visited] == true
      flash.now[:notice] = "HINT: Have you eaten your carrots today?"
    end
    if session[:carrots_eaten]
      if session[:carrots_eaten] == 1
        @eaten_one_carrot = true
      elsif session[:carrots_eaten] == 2
        @eaten_two_carrots = true
      elsif session[:carrots_eaten] >= 3
        @eaten_three_carrots = true
      end
    end
  end

  def page5_eat_carrot
    # carrot button is clicked
    # later on, include pocket functionality here?
    session[:carrots_eaten] += 1
    redirect_to '/game/page5'
  end

  def page6
    redirect_to "/" unless logged_in?
    session[:current_page] = request.fullpath
    autosave
    import_pocket
    session[:page6_visited] = true
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
      add_to_pocket("Carrot")
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
    redirect_to "/" unless logged_in?
    session[:keys_grabbed] = true
    redirect_to "/game/page1"
  end

  def lock_door
    redirect_to "/" unless logged_in?
    if session[:equipped_item] != "Keys"
      session[:incorrect_lock_item_message] = "You tried, unsuccessfully, to lock your door with a #{session[:equipped_item]}"
    else
      session[:door_locked] = true
      session[:incorrect_lock_item_message] = nil
    end
    redirect_to "/game/page2"
  end

  def win
    redirect_to "/" unless logged_in?
    import_pocket
  end

  private

  def puzzle_input_correct?(input, answer)
    input.downcase.include?(answer)
  end

  def setup_puzzle_page(puzzle_text, puzzle_answer, hint_text)
    session[:puzzle_attempts] = 0 unless session[:puzzle_answer]
    @puzzle_text = puzzle_text
    @city_name = session[:city]
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

  def autosave
    find_save = Save.find_or_create_by(user_id: session[:user_id])
    find_save.update_attribute(:last_level, session[:current_page]) #unless find_save.last_level[-1].to_i > session[:current_page][-1].to_i
  end

  def get_city_name
    response_1 = 
    (JSON.parse HTTParty.get('http://geodb-free-service.wirefreethought.com/v1/geo/cities?limit=5&offset=0&location=53.6801-1.492', format: :plain), symbolize_names: true)[:data]
    response_2 = 
    (JSON.parse HTTParty.get('http://geodb-free-service.wirefreethought.com/v1/geo/cities?limit=5&offset=0&location=54.977777777-1.613333333', format: :plain), symbolize_names: true)[:data]
    response_3 = 
    (JSON.parse HTTParty.get('http://geodb-free-service.wirefreethought.com/v1/geo/cities?limit=5&offset=0&location=53.466666666-2.233333333', format: :plain), symbolize_names: true)[:data]
    full_response = response_1 + response_2 + response_3
    full_response[rand(full_response.length - 1)][:name]
  end

end
