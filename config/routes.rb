Rails.application.routes.draw do
  resources :sequences, only: :create
  root 'home#index'
end
