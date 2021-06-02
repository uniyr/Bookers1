Rails.application.routes.draw do
  #resources :books 重複する
  get 'top' => 'books#top'
  root :to => 'books#top'
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book' #as book　とは
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show', as: 'book_params'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end

