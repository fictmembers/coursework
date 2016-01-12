Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
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
    resources :users
    resources :messages
    resources :menus
    resources :sessions, only: [:new, :create, :destroy]
    resources :usersessions, only: [:new, :create, :destroy]

    root 'administrators#landing'

    match '/controlpanel',            to: 'administrators#panel', via: 'get'
    match '/newreview',               to: 'review_books#new', via: 'get'
    match '/authorise',               to: 'sessions#new',                     via: 'get'
    match '/signout',                 to: 'sessions#destroy',                 via: 'delete'
    match '/main',                    to: 'administrators#landing',           via: 'get'
    match '/customers/:id/order',     to: 'customers#order',                  via: 'get'
    match '/customers/:id/restaurant', to: 'customers#restaurant', via: 'get'
    match '/complete',                to: 'orders#complete',                  via: 'get'
    match '/resivefeed',              to: 'review_books#resivefeed',          via: 'get'

    match '/allrestaurants',          to: 'restaurants#restaurants',          via: 'get'
    match '/reservationcomplete',     to: 'reservations#completereservation', via: 'get'

    match '/topwaiters',              to: 'administrators#topwaiters',        via: 'get'
    match '/lastweektop',             to: 'administrators#lastweektop',       via: 'get'
    match '/alldayslong',             to: 'administrators#alldayslong',       via: 'get'

    match '/sendmessage',             to: 'messages#new',                     via: 'get'
    match '/im',                      to: 'messages#im',                      via: 'get'
    match '/imsended',                to: 'messages#imsended',                via: 'get'

    match '/user_signup',             to: 'users#new',                        via: 'get'
    match '/user_signin',             to: 'usersessions#new',                 via: 'get'
    match '/user_signout',            to: 'usersessions#destroy',             via: 'delete'
  end
end
