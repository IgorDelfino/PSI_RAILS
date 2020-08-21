Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Studio Routes
  get '/studio/list'
  get '/studio/show/:id', to: 'studio#show'
  get '/studio/delete/:id', to: 'studio#delete'
  get '/studio/:id/movies', to: 'studio#show_movies_of_studio'
  patch '/studio/update/:id', to: 'studio#update'
  post '/studio/create'

  # Movie Routes
  get '/movie/list'
  get '/movie/show/:id'
  get '/movie/delete/:id'
  get '/movie/:id/studio'
  patch '/movie/update/:id', to: 'movie#update'
  post '/movie/create'

end
