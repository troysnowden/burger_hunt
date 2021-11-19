Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"
  get "/game/home", to: "game#home"
  get "/game/right", to: "game#right"
  get "/game/left", to: "game#left"

  get "/users/register", to: "user#register"
  post "/users/register", to: "users#create"
  get "/users/login", to: "users#login"
  post "/users/login", to: "users#authenticate"
  get "/users/logout", to: "users#logout"

  get "/articles/room1", to: "articles#room1"
  get "/articles/room2", to: "articles#room2"
  get "/articles/game-over", to: "articles#game_over"
  get "/articles/journey-end", to: "articles#winner"

end
