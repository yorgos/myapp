Rails.application.routes.draw do
  # A resource route maps a number of related requests to actions in a single controller
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/index' #syntax = HTTP verb (for example 'get'), path (Controller#Action)
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/landing_page'

  root "static_pages#landing_page" #syntax = root "controller#view"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
