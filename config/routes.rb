Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :orders
  resources :groups
  resources :users
  resources :tests
  post 'groups/:group_id/add', to: 'groups#addFriendToGroup', as: 'add_friend_group'
  get 'groups/:group_id/details', to: 'groups#groupDetails', as: 'group_details'
  put 'orders/:orderId/status', to: 'orders#updateStatus', as: 'update_state'
  delete 'groups/:group_id/delete/:user_id', to: 'groups#removeFriendFromGroup', as: 'delete_friend_from_group'
  root 'users#index'

  
  post 'orders/checkInvitedExistance', to: 'orders#checkInvitedExistance', :as => 'checkInvitedExistance'
  patch '/invitations/:invitation', to: 'user_invitations#update', as: 'update_invitation_status'
  get 'friends/index', to: 'friends#index' ,:as => :friends

  post 'friends/create', to: 'friends#create' 
  delete 'friends/destroy', to: 'friends#destroy' 
  get 'friends/new', to: 'friends#new' 
  get 'friends/show', to: 'friends#show'

  resources :user_join_orders
resources :user_invited_to_orders
  resources :order_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
