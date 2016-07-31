Rails.application.routes.draw do

  get 'static_pages/index' #syntax = 'folder/subfolder'
  get 'static_pages/about'
  get 'static_pages/contact'

  root "static_pages#index" #syntax = root "controller#view"

  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
