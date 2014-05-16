Rails.application.routes.draw do

resources :users

match '/signup',  to: 'users#new', via: 'get'

root 'statuses#index'
post 'statuses' => 'statuses#create'
get 'statuses/new' => 'statuses#new', 			as: 'new_status' 
get 'statuses/:id' => 'statuses#show', 			as: 'status'
get 'statuses/:id/edit' => 'statuses#edit', as: 'edit_status'
patch 'statuses/:id' => 'statuses#update'
delete 'statuses/:id' => 'statuses#delete'

end
