Rails.application.routes.draw do
  devise_for :users

  get 'general_settings/limits'
  get 'general_settings/form'
  post 'general_settings/save'

  resources :data
  resources :mobiles
  resources :zone__devices
  resources :location_devices
  resources :access_points
  resources :permissions_roles
  resources :permissions
  resources :roles
  resources :users
  resources :zones
  resources :devices
  resources :coordinates, only: :index
  namespace :api do
    post 'data/data_gather'
  end

  get 'dashboard/home'
  root 'dashboard#home'

end
