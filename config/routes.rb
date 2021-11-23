Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"
  get "/game/page-1", to: "game#page-1"
  post "/game/page-1", to: "game#page-2"
  get "/game/page3", to: "game#page3"
  post "/game/puzzle-answer", to: "game#puzzle_check"

  get "/register", to: "users#register"
  post "/register", to: "users#create"
  get "/login", to: "users#login"
  post "/login", to: "users#authenticate"
  get "/logout", to: "users#logout"

end
