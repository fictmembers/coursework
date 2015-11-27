Rails.application.routes.draw do

  resources :bills
  resources :cashiers
  resources :chefs
  resources :customers
  resources :halls
  resources :items
  resources :orders
  resources :reservations
  resources :restaurants
  resources :hostesses
  resources :review_books
  resources :tables
  resources :waiters

end
