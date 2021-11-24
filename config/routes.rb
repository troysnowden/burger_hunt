Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"

  get "/game/page1", to: "game#page1"
  post "/game/page1", to: "game#page2"
  # The post route above may not be needed if we change the button to a link?
  get "/game/page2", to: "game#page2"
  get "/game/page3", to: "game#page3"
  get "/game/page4", to: "game#page4"
  post "/game/puzzle-answer", to: "game#puzzle_check"
  get "/game/page5", to: "game#page5"
  get "/game/page5-eat-carrot", to: "game#page5_eat_carrot"

  get "/game/page6", to: "game#page6"
  get "/game/page6-bike", to: "game#page6_bike"
  get "game/win", to: "game#win"

  get "/save", to: "saves#create"

  get "/register", to: "users#register"
  post "/register", to: "users#create"
  get "/login", to: "users#login"
  post "/login", to: "users#authenticate"
  get "/logout", to: "users#logout"

end
