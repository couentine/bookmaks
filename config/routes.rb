Rails.application.routes.draw do
  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  resources :topics do
    resources :bookmarks, except: [:index]
end
  devise_for :users
  root 'welcome#index'

  get 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
