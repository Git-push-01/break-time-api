Rails.application.routes.draw do




  namespace :api do


    namespace :v1 do


  resources :employees
  resources :managers
  resources :companies
  resources :breaks
  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
end
