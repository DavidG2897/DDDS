Rails.application.routes.draw do
  resources :contacts
  resources :admin_devices
  root 'home#index'
  resources :devices
  devise_for :users
  patch 'synch', to: 'sync#update'
  post  'emergency/create/:lat/:long/device/:devid', to: "emergencies#create"
  get 'emergencies', to: 'emergencies#index'
  post 'location/create/:lat/:long/emergency/:em_id', to: "locations#create"
  match 'locations/:em_id' => 'locations#index', :as => 'emergency_locations', via: :get
end
