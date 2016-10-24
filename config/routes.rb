Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :attractions
  resources :rides
  resources :sessions

end
