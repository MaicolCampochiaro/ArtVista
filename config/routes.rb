Rails.application.routes.draw do
  devise_for :users
  resources :artworks, except: [:index]
  root to: "artworks#index"

  post "/reservations" => "reservations#create"
  get "/artworks" => "artworks#home"
  get "/users/:id" => "users#show", as: :user
  patch "/users/:id" => "users#update"
  get "/users/:id/edit" => "users#edit", as: :user_edit
  get "up" => "rails/health#show", as: :rails_health_check

end
