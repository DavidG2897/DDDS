Rails.application.routes.draw do
  resources :contacts
  resources :admin_devices
  root 'home#index'
  resources :devices
  devise_for :users
end
