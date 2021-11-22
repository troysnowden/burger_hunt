Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"
  get "game/page-1", to: "game#page-1"
  post "game/page-1", to: "game#page-2"
  

  get "/register", to: "users#register"
  post "/register", to: "users#create"
  get "/login", to: "users#login"
  post "/login", to: "users#authenticate"
  get "/logout", to: "users#logout"

  get "/articles/room1", to: "articles#room1"
  get "/articles/room2", to: "articles#room2"
  get "/articles/game-over", to: "articles#game_over"
  get "/articles/journey-end", to: "articles#winner"

end
