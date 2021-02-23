Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/index'
  resources :properties
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
