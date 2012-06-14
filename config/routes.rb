MahBucketList::Application.routes.draw do
  
  resources :sessions
  get '/logout' => 'sessions#destroy', :as => :sign_out
  
  resources :lists do
    resources :items
  end
  
  resources :votes, :only => [:create, :destroy]
  
  get '/users/index' => 'users#new'
  get '/users/' => 'users#new'
  
  resources :users, :except => :index
  
  #recreated routes for users model because wanted the index for users to go to sign up page instead of route error
  # get '/users' => 'users#new'
  # get '/users/index' => 'users#new'
  # post '/users/create' => 'users#create'
  # get '/users/new' => 'users#new', :as => :new_user
  # get '/users/:id/edit' => 'users#edit', :as => :edit_user
  # get '/users/:id' => 'users#show', :as => :user
  # put 'users/:user_id/update' => 'users#update'
  # delete 'users/:user_id' => 'users#destroy'
  
  root to:  'lists#index'
  
end
 