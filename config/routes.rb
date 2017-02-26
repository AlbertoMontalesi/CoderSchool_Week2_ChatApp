Rails.application.routes.draw do

  get 'messages/incoming'
  get 'messages/sent'

  resources :messages do
    collection do #we display many messages therefore use collection
      get 'incoming'
    end
    member do #use member for the single message 
      post 'mark_as_read'
    end
  end


  resources :messages

  resources :friendships

  resources :sessions, only: [:new, :create]
  #get 'sessions/new', as: :login #alternatively  can use resources only: [:new, :create]
  #post 'sessions' => 'session#create', as: :submit_login 
  
  delete 'logout' => 'sessions#destroy'

   #match '/sessions' => 'sessions#create', via: [:get, :post] #i got a problem for create using only post

  resources :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
