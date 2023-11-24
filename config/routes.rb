Rails.application.routes.draw do
  devise_for :users
  resources :artworks, except: [:index]
  root to: "artworks#home"

  get "/reservations" => "reservations#index"
  get "/reservations/:id" => "reservations#show", as: :reservation
  post "/reservations" => "reservations#create"
  get "/users/:id" => "users#show", as: :user
  patch "/users/:id" => "users#update"
  get "/users/:id/edit" => "users#edit", as: :user_edit
  get "up" => "rails/health#show", as: :rails_health_check

end
