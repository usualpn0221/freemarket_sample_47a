Rails.application.routes.draw do
  get 'creditcards/index'

  get 'creditcards/edit'



  get 'buys/index'

  devise_for :users
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
