Rails.application.routes.draw do
  devise_for :users
  get 'general_settings/form'
  get 'general_settings/save'
  resources :data
  resources :mobiles
  resources :zone__devices
  resources :location_devices
  resources :access_points
  resources :cordinates
  resources :permises_roles
  resources :permises
  resources :roles
  resources :users
  namespace :api do
    get 'location/get'
  end
  get 'dashboard/home'
  root 'dashboard#home'
  resources :zones
  resources :devices
end
