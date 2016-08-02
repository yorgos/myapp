Rails.application.routes.draw do

  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/index' #syntax = HTTP verb (for example 'get'), path (Controller#Action)
  get 'static_pages/about'
  get 'static_pages/contact'

  root "products#index" #syntax = root "controller#view"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
