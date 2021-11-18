Rails.application.routes.draw do
  root "articles#index"
  
  get "/articles", to: "articles#index"
  get "/articles/room1", to: "articles#room1"
  get "/articles/room2", to: "articles#room2"
  get "/articles/journey-end", to: "articles#journey_end"
  get "/articles/game-over", to: "articles#game_over"
end
