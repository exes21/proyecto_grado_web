Rails.application.routes.draw do
  devise_for :users

  get 'general_settings/limits'
  get 'general_settings/form'
  post 'general_settings/save'
  resources :portal
  get 'portal/file', to: 'portal#file'
  resources :data
  resources :mobiles
  resources :access_points
  resources :permissions
  resources :roles
  resources :users
  post 'users/create_administrator', to: 'users#create_administrator'
  get "users_map", to: "users#users_map"
  get "administradores", to: "users#usuario_administrador"
  get 'inactivar_administrador', to: 'users#inactivar_admin'
  get 'inactivar_usuario', to: 'users#inactivar_user'
  post "users/load", to: "users#load", as: 'user_imports'
  resources :zones
  get "zone/view", to: "zones#zone_view"
  resources :devices
  resources :alerts do
    get 'notificar'
    post 'cancelar'
    post 'cerrar'
    post 'comentar'
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

  get 'dashboard', to: 'dashboard#home'
  root 'portal#index'

end
