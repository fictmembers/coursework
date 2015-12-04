Rails.application.routes.draw do

  resources :administrators
  resources :bills
  resources :cashiers
  resources :chefs
  resources :customers
  resources :halls
  resources :items
  resources :managers
  resources :orders
  resources :reservations
  resources :restaurants
  resources :hostesses
  resources :review_books
  resources :tables
  resources :waiters
  resources :menus
  resources :sessions, only: [:new, :create, :destroy]


  root 'administrators#panel'

  match '/controlpanel',       to: 'administrators#panel',            via: 'get'
  match '/authorise',          to: 'sessions#new',                    via: 'get'
  match '/signout',       to: 'sessions#destroy',                     via: 'delete'
end
