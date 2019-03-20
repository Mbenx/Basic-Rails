Rails.application.routes.draw do
  # manual style
  # get 'books', to: 'books#index'
  # get 'books/show/:id', to: 'books#show'
  # get 'books/new', to: 'books#new'
  # post 'books/create', to: 'books#create'
  # get 'books/edit/:id', to: 'books#edit'
  # put 'books/update/:id', to: 'books#update'
  # delete 'books/destroy/:id', to: 'books#destroy'
 
  # set otomatis
  resources :books

  # set only 
  # resources :books, only: [:index, :show]

  # set expect
  # resources :books, expect: [:index, :show]

  get '/home', to: 'home#index'
  get '/hallo', to: 'home#hallo'
  get '/show', to: 'home#show'
  get '/edit/:id', to: 'home#edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
