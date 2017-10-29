Rails.application.routes.draw do
  devise_for :users
  root 'movies#index', as: 'home'
#   resources :movies do
#     collection do
#     get 'search'
#   end
# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/movies', to: 'movies#index', as: 'movies'
  post '/movies', to:'movies#create', as: 'add_movie'
  get '/movies/new',to: 'movies#new', as: 'new_movie'
  get '/movie/:id/edit', to:'movies#edit', as: 'edit_movie'
  get '/movies/:id',to:'movies#show', as: 'movie'
  put '/movies/:id', to:'movies#update', as: 'update_movie'
  get '/movies' ,to: 'movies#order_movies', as: 'sorted_movies'
  delete '/movies/:id', to:'movies#destroy', as: 'delete_movie'
  # resources :movies do
  # resources :reviews, except: [:index, :show]
  # end
  post '/movies/:movie_id/reviews', to: 'reviews#create', as: 'movie_reviews'
  get '/movies/:movie_id/reviews/new', to: 'reviews#new', as: 'new_movie_review'
  get '/movies/:movie_id/reviews/:id/edit', to: 'reviews#edit', as: 'edit_movie_review'
  put '/movies/:movie_id/reviews/:id', to: 'reviews#update', as: 'movie_review'
  get '/movies/search', to: 'movies#search', as: 'search_movies'


end
