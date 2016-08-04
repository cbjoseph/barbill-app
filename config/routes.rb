Rails.application.routes.draw do
  get '/' => 'bars#index'
  get '/bars' => 'bars#index'

  get '/signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
