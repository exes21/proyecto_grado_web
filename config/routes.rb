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
  resources :permises_roles
  resources :permises
  resources :roles
  resources :users
  resources :zones
  resources :devices

  namespace :api do
    get 'location/get'
  end
  get 'dashboard/home'
  root 'dashboard#home'

end
