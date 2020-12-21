Rails.application.routes.draw do

  get 'sessions/new'
  get 'stores/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :stores
  resources :reviews,          only: [:create, :destroy]
end
