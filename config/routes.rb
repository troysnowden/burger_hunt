Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"
  get "/game/page-1", to: "game#page-1"
  post "/game/page-1", to: "game#page-2"

  get "/register", to: "users#register"
  post "/register", to: "users#create"
  get "/login", to: "users#login"
  post "/login", to: "users#authenticate"
  get "/logout", to: "users#logout"

end
