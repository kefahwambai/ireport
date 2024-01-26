Rails.application.routes.draw do
 
  resources :redflags
  resources :interventions
  resources :password_resets, only: [:create, :update]
  resources :government_agencies
  resources :users
  resources :sessions, only: [:create, :destroy]

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'users#show'  
 

 scope '/users', module: 'users' do
  resources :redflags, only: [:index, :update, :destroy]
  resources :interventions, only: [:index, :update, :destroy]
 end

 
end
