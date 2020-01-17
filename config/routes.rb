Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }

  root to: 'home#index'

  resources :users
  resources :shops, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create]
  end

end
