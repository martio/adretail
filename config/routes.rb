Rails.application.routes.draw do
  resources :sequences
  root 'home#index'
end
