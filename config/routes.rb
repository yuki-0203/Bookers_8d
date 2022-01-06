Rails.application.routes.draw do

  get 'search/search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  root :to => "homes#top"
  get "home/about" => "homes#about"
  get 'search' => "searchs#search"
  resources :groups

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]do
    resources :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  
end
