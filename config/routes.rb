Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, only: [:new, :create, :show, :edit, :update] do
    resources :days, only: [] do
        patch :assign_place, on: :collection
      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
