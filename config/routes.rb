Rails.application.routes.draw do
  get '/drawing' => 'bars#draw'
  get '/' => 'bars#index'
  get '/bars' => 'bars#index'
  get '/bars/stadiums' => 'bars#just_show_stadiums'
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

  get '/bartender_signup' => 'bartenders#new'
  post '/bartenders' => 'bartenders#create'

  get '/queue' => 'queued_drinks#index'
  get '/queue/:id/edit' => 'queued_drinks#edit'
  patch '/queue' => 'queued_drinks#update'

  get '/bartender_login' => 'bartender_sessions#new'
  post '/bartender_login' => 'bartender_sessions#create'
  get '/bartender_logout' => 'bartender_sessions#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
  get '/orders/:id/status' => 'orders#status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
