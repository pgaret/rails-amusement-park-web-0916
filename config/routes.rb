Rails.application.routes.draw do
  root "sessions#home"
  resources :users
  resources :attractions
  resources :rides
  resources :sessions#, except: [:new, :destroy]
  get '/signin', to: 'sessions#new'#, as: 'signin'
  get '/signout', to: 'sessions#destroy'#, as: 'signout'

end
