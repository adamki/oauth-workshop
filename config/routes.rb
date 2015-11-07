Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/twitter', as: :login
  get 'logout'=> 'sessions#destroy', as: :logout
  get '/auth/twitter/callback' =>  "sessions#create"
end

