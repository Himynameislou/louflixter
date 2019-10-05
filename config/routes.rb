Rails.application.routes.draw do
    devise_for :users
    devise_for :models
    resource :dashboard, only: [:show]
    root 'static_pages#index'
<<<<<<< HEAD
    resources :courses, only: [:index, :show]
=======
    get 'privacy', to: 'static_pages#privacy'
    get 'team', to: 'static_pages#team'
    get 'careers', to: 'static_pages#careers'
    resources :courses, only: [:index, :show] do
      resources :enrollments, only: :create
    end
    resources :lessons, only: [:show]
>>>>>>> 116346d35c3c9d53f85cbb03f579f82c20b13f26
    namespace :instructor do
      resources :lessons, only: [:update]
      resources :sections, only: [] do
        resources :lessons, only: [:create]
      end
      resources :courses, only: [:new, :create, :show] do
        resources :sections, only: [:create]
      end
    end
  end