Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/preflight', to: "users#preflight"

  resources :users
  resources :challenges
  resources :payments
  resources :refcodes

end
