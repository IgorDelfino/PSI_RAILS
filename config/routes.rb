Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Studio Routes
  get '/studio/list'
  get '/studio/show/:id' => 'studio#show'
  delete '/studio/delete/:id' => 'studio#delete'
  get '/studio/:id/movies' => 'studio#show_movies_of_studio'
  patch '/studio/update/:id' => 'studio#update'
  post '/studio/create'

  # Movie Routes
  get '/movie/list'
  get '/movie/show/:id' => 'movie#show'
  delete '/movie/delete/:id' => 'movie#delete'
  get '/movie/:id/studio' => 'movie#show_studio_of_movie'
  patch '/movie/update/:id' => 'movie#update'
  post '/movie/create'
  
  # Ghibli Routes
  get '/movies/add/ghibli' => 'ghibli#add_ghibli_movies_to_database'
  get '/movies/ghibli' => 'ghibli#get_all_ghibli_movies'

end
