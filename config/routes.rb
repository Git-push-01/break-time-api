Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :users
        get 'user', to: 'users#show', as: 'user_show'
      post 'signup', to: 'users#create', as: 'user_signup'
      post 'login', to: 'users#login', as: 'user_login'

  resources :breaks
  resources :employees
  resources :managers
  resources :companies

end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
