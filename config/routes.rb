Rails.application.routes.draw do
  post 'particle/pour'
  get 'dashboard', to: 'smartaps#dashboard'
  get 'edit_smartap', to: 'smartaps#edit'

  resources :calibrations
  resources :ticks
  resources :pours
  resources :loads
  resources :products
  resources :owners
  resources :placements
  resources :machines
  resources :locations
  devise_for :users
  resources :users

  get 'static_pages/help'

  authenticated :user do
    root 'smartaps#dashboard' , as: :authenticated_root
  end

  root to: 'visitors#index'
end
