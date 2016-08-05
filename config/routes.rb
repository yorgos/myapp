Rails.application.routes.draw do
  devise_for :users
  resources :users
  # A resource route maps a number of related requests to actions in a single controller
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  #syntax = HTTP verb (for example 'get'), path (Controller#Action)
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

  #syntax = root "controller#view"
  root "static_pages#landing_page"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
