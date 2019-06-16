Rails.application.routes.draw do
  
  resources :join_on_d_sd_bs
  # =>admin page
  
  get 'administrators/home', to:'administrator#home'
  
  get 'sub_departments/manage', to: 'sub_departments#manage'
  resources :sub_departments, :except => :show
  
  get 'departments/manage', to: 'departments#manage'
  resources :departments, :except => :show
  
  get 'departments/:name', to:'departments#show'
  get 'sub_departments/:id', to:'sub_departments#show'
  
  resources :orders
  
  resources :line_items
  post 'line_items/:id', to: 'line_items#create'
  
  resources :carts
 
  get 'paypal/checkout', to: 'subscriptions#paypal_checkout'
  get 'sessions/new'

  root 'pages#home' 
  
  get '/signup' ,  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete'/logout', to: 'sessions#destroy'
  
  
  resources :users
  
  get 'products/manage', to: 'products#manage'
  resources :products
  
  get 'brands/manage', to: 'brands#manage'
  resources :brands
  
  resources :account_activations, only: [:edit]
  resources :joindsbs
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
