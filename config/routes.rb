Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  namespace :instructor do
    resources :courses, only: [:new, :create, :show]
  end
end
