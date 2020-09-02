Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  get 'invitation/create'
  get 'invitation/destroy'
  
  resources :invitations, only: [:create, :destroy]

  delete 'remove_friend', to: 'invitations#destroy'
  post 'accept_friend', to: 'invitations#accept_invite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
