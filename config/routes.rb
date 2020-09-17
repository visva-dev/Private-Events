Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  post 'sessions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new, :show]
  root to: 'users#new'
  resources :events, only: [:create, :new, :show, :index]
end