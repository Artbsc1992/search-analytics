Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  authenticated :user do
    root "articles#index", as: :authenticated_root
  end

  resources :articles, only: [:index]

  root "articles#index"


end
