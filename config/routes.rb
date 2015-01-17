Rails.application.routes.draw do
  
  root 'application#home'

  get '/calculate' => 'properties#calculate', as: :calculate
  get '/full_list' => 'properties#full_list', as: :full_list

  get '/signup' => 'users#new', as: :signup

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :users
  resources :properties

end
