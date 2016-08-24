Rails.application.routes.draw do
  # Devise for authentication
  devise_for :users, :controllers => { :registrations => "user_registrations" }

  # Nested resource of comments is a subset of products
  resources :products do
    resources :comments
  end

  # A resource route maps a number of related requests to actions in a single controller
  resources :users

  resources :orders, only: [:index, :show, :create, :destroy]

  #syntax = HTTP verb (for example 'get'), path (Controller#Action)
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

  post 'payments/create'

  # Action cable
  mount ActionCable.server => '/cable'

  #syntax = root "controller#view"
  root "static_pages#landing_page"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
