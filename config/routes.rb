Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/show'
  get 'searches/search'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get "search" => "searches#search"
end