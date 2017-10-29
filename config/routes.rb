Rails.application.routes.draw do
  devise_for :users
  root 'movies#index', as: 'home'
  #resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/movies', to: 'movies#index', as: 'movies'
  post '/movies', to:'movies#create', as: 'add_movie'
  get '/movies/new',to: 'movies#new', as: 'new_movie'
  get '/movie/:id/edit', to:'movies#edit', as: 'edit_movie'
  get '/movies/:id',to:'movies#show', as: 'movie'
  put '/movies/:id', to:'movies#update', as: 'update_movie'
  get '/movies' ,to: 'movies#order_movies', as: 'sorted_movies'
  delete '/movies/:id', to:'movies#destroy', as: 'delete_movie'
end
