Rails.application.routes.draw do
  get 'buys/index'

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
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
  resources :category, only: [:index, :show]
  resources :profiles, only: :show
  post 'pay'     => 'creditcards#create'
  get 'complete' => "users#complete"
end
