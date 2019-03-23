Rails.application.routes.draw do
  devise_for :users

  get 'general_settings/limits'
  get 'general_settings/form'
  post 'general_settings/save'

  resources :data
  resources :mobiles
  resources :access_points
  resources :permissions
  resources :roles
  resources :users
  get "administradores", to: "users#usuario_administrador"
  post "users/load", to: "users#load", as: 'user_imports'
  resources :zones
  resources :devices
  resources :alert
  resources :coordinates, only: :index
  namespace :api do
    post 'data/data_gather'
    post 'data/access_points'
  end

  get 'dashboard/home'
  root 'dashboard#home'

end
