Rails.application.routes.draw do

resources :users

resources :sessions, only: [:new, :create, :destroy]

match '/signup',  to: 'users#new', via: 'get'
match '/signup',  to: 'users#new',            via: 'get'
match '/signin',  to: 'sessions#new',         via: 'get'
match '/signout', to: 'sessions#destroy',     via: 'delete'

root 'statuses#index'
post 'statuses' => 'statuses#create'
get 'statuses/new' => 'statuses#new', 			as: 'new_status' 
get 'statuses/:id' => 'statuses#show', 			as: 'status'
get 'statuses/:id/edit' => 'statuses#edit', as: 'edit_status'
patch 'statuses/:id' => 'statuses#update'
delete 'statuses/:id' => 'statuses#delete'

end
