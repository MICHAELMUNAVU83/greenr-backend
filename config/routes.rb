Rails.application.routes.draw do
 
  # config/routes.rb
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :carbon_credits
      post '/login', to: 'auth#create'
      resources :purchases
      get '/profile', to: 'users#profile'
    end
  end
end