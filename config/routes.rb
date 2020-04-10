Rails.application.routes.draw do
  resources :contacts
  resources :admin_devices
  root 'home#index'
  resources :devices
  devise_for :users
  patch 'synch', to: 'sync#update'
  post  'emergency/create/:lat/:long/device/:devid', to: "emergencies#create"
end
