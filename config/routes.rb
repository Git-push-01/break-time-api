Rails.application.routes.draw do
  resources :breaks
  resources :employees
  resources :managers
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
