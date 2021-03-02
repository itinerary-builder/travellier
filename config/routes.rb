Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, only: [:new, :create, :show] do
    resources :days, only: [:show, :update, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
