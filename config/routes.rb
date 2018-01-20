Rails.application.routes.draw do

  root 'users#show'

  get 'likes/index'

  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  resources :topics do
    resources :bookmarks, except: [:index] do
  resources :likes, only: [:index, :create, :destroy]
  end
end


  devise_for :users
  resources :users, only: [:show]
  get 'welcome/index'

  get 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
