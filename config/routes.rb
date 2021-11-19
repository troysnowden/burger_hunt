Rails.application.routes.draw do
  root "game#index"
  
  get "/game", to: "game#index"
  get "/game/register", to: "game#register"
  post "/game/register", to: "game#register_name"
  get "/game/home", to: "game#home"
  get "/game/right", to: "game#right"
  get "/game/left", to: "game#left"

  get "/articles/room1", to: "articles#room1"
  get "/articles/room2", to: "articles#room2"
  get "/articles/game-over", to: "articles#game_over"
  get "/articles/journey-end", to: "articles#winner"

end
