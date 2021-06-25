Rails.application.routes.draw do
  resources :subscriptions
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  root "events#index"
  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit]
end
