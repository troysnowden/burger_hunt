Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"

  get "/game/page-5", to: "game#page-5"
  get "/game/home", to: "game#home"
  get "/game/right", to: "game#right"
  get "/game/left", to: "game#left"
  get "/game/page2", to: "game#page2"
  get "/game/page1", to: "game#page1"
  post "/game/page1", to: "game#page2"
  get "/game/page3", to: "game#page3"
  post "/game/puzzle-answer", to: "game#puzzle_check"

  get "/register", to: "users#register"
  post "/register", to: "users#create"
  get "/login", to: "users#login"
  post "/login", to: "users#authenticate"
  get "/logout", to: "users#logout"

end
