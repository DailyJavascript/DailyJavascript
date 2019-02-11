Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/users/preflight', to: "users#preflight"
  get '/users/get_price', to: "users#get_price"
  get '/private/subs', to: "users#show_subscriptions"
  get '/private/challenges', to: "challenges#new"
  get '/users/unsubscribe', to: "users#unsubscribe"
  get '/ref_codes/all', to: "ref_codes#show_all"
  post '/visits/update', to: "visits#update"
  post '/visits', to: "visits#create"

  resources :users
  resources :challenges
  resources :payments
  resources :ref_codes
  
end
