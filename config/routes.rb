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
  get "users_map", to: "users#users_map"
  get "administradores", to: "users#usuario_administrador"
  post "users/load", to: "users#load", as: 'user_imports'
  resources :zones
  get "zone/view", to: "zones#zone_view"
  resources :devices
  resources :alerts do
    post 'cancelar'
    post 'cerrar'
  end
  get "alert/setting", to: "alerts#edit"
  post "alert/setting", to: "alerts#save_setting"
  resources :coordinates, only: :index
  namespace :api do
    post 'data/data_gather'
    post 'data/access_points'
    post 'data/zones'
    get 'data/zone'
    post "data/zone_save_limits"
    get 'data/last_connected_users'
  end

  get 'dashboard/home'
  root 'dashboard#home'

end
