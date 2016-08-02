Rails.application.routes.draw do

  get 'static_pages/index' #syntax = 'folder/subfolder'
  get 'static_pages/about'
  get 'static_pages/contact'

  root "static_pages#landing_page" #syntax = root "controller#view"

  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
