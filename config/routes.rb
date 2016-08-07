Rails.application.routes.draw do
  get '/' => 'bars#index'
  get '/bars' => 'bars#index'
  get '/bars/new' => 'bars#new'
  post '/bars' => 'bars#create'
  get '/bars/:id' => 'bars#show'
  get '/bars/:id/edit' => 'bars#edit'
  patch 'bars/:id' => 'bars#update'
  delete 'bars/:id' => 'bars#destroy'

  get '/carted_drinks' => 'carted_drinks#index'
  post '/carted_drinks' => 'carted_drinks#create'
  delete '/carted_drinks/:id' => 'carted_drinks#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
