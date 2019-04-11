Rails.application.routes.draw do
  get 'buys/index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  root 'items#index'
  resources :users
  resources :items do
    resources :buys, only: [:new,:create,:update] do
      collection do
        post 'pay'
      end
    end
    resources :comments
  end
  resources :phonenumber
  resources :address
  resources :creditcards
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
