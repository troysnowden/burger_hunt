Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"
  get "/game/home", to: "game#home"
  get "/game/right", to: "game#right"
  get "/game/left", to: "game#left"
  get "/game/choice_1", to: "game#choice_1"
  get "/game/page-1", to: "game#page-1"
  post "/game/page-1", to: "game#page-2"

  get "/register", to: "users#register"
  post "/register", to: "users#create"
  get "/login", to: "users#login"
  post "/login", to: "users#authenticate"
  get "/logout", to: "users#logout"

end
