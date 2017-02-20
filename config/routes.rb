Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]
  #get 'sessions/new', as: :login #alternatively  can use resources only: [:new, :create]
  #post 'sessions' => 'session#create', as: :submit_login 
  
  delete 'logout' => 'sessions#destroy'

   #match '/sessions' => 'sessions#create', via: [:get, :post] #i got a problem for create using only post

  resources :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
