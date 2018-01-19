Rails.application.routes.draw do
  resources :topics
  devise_for :users
  root 'welcome#index'

  get 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
