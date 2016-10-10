Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root 'welcome#index'
 	get '/booking/check'
 	resources :user
 	resources :userlist
 	resources :hotel
 	resources :room
 	resources :room_type
 	resources :superadmin
 	resources :booking
 	resources :admin
 	resources :admin
 	resources :room_availability
 	get '/booking/show'
end
