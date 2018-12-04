Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/users/preflight', to: "users#preflight"
  get '/private/subs', to: "users#show_subscriptions"
  get '/private/challenges', to: "challenges#new"
  get '/users/unsubscribe', to: "users#unsubscribe"
  get '/ref_codes/all', to:"ref_codes#show_all"

  resources :users
  resources :challenges
  resources :payments
  resources :ref_codes

end
