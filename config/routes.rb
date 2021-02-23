Rails.application.routes.draw do
  resources :properties
  resources :bookings
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "users/:user_id/bookings", to: "bookings#users_index", as: :user_bookings
  get "users/:user_id/properties", to: "properties#users_index", as: :user_properties
end
