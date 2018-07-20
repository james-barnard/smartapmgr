Rails.application.routes.draw do
  post 'particle/pour'
  get 'dashboard', to: 'smartaps#dashboard'

  resources :calibrations
  resources :ticks
  resources :pours
  resources :loads
  resources :products
  resources :owners
  resources :placements
  resources :machines
  resources :locations
  root to: 'visitors#index'
  devise_for :users
  resources :users


  get 'static_pages/help'
  root 'smartaps#dashboard'
end
