MahBucketList::Application.routes.draw do
  
  resources :sessions
  
  resources :lists do
    resources :items
  end
  
  resources :votes, :only => [:create, :destroy]
  
  resources :users 
  
  get '/logout' => 'sessions#destroy', :as => :sign_out
  
  root to:  'lists#index'
  
end
 