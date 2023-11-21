Rails.application.routes.draw do
  devise_for :users
  resources :artworks, except: [:index]
  root to: "artworks#home"

  get "up" => "rails/health#show", as: :rails_health_check

end
