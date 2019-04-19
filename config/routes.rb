Rails.application.routes.draw do
  get 'cards/new'

  get 'cards/create'

  get 'buys/index'

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks',
        sessions: 'users/sessions'
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
  resources :categories, only: [:index, :show, :new]
  resources :profiles, only: :show
  post 'pay'     => 'creditcards#create'
  post 'pays'     => 'cards#create'
  get 'complete' => "users#complete"
end
