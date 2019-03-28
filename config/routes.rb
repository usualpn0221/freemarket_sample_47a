Rails.application.routes.draw do
  get 'creditcards/index'

  get 'creditcards/edit'

  get 'buys/new'

  get 'buys/create'

  get 'buys/index'

  devise_for :users
  root 'users#show'
  resources :users
  resources :items do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
