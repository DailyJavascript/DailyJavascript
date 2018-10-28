Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/preflight', to: "users#preflight"
  get '/private/subs', to: "users#show_subscriptions"

  resources :users
  resources :challenges
  resources :payments
  resources :refcodes

end
