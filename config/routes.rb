Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest




  # Defines the root path route ("/")
  root 'sessions#home'


  # REGISTRATION 
  resources :users, only: [:new, :create]
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'



  # LOGIN ROUTES
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



  # 2FA GOOGLE
  resources :user_mfa_sessions, only: [:new, :create]
  get '/mfa', to: 'user_mfa_sessions#new'
  post 'mfa', to: 'user_mfa_sessions#create'


  # LOAN
  resources :loans, only: [:new, :create]
  get '/application', to: 'loans#new'
  post '/application', to: 'loans#create'

end
