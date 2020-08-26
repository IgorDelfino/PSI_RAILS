require 'net/http'
require 'json'

class GhibliController < ApplicationController
    # adiciona os filmes da ghibli na database
    # praticamente um seeder que pega suas informações de uma api externa
    def add_ghibli_movies_to_database
        uri = URI('https://ghibliapi.herokuapp.com/films/') # rota da api usada para retornar os filmes da ghibli
        movies = JSON.parse(Net::HTTP.get(uri)) # faz o parse do resultado em um json para facilitar a manipulação
        studio = Studio.where(name: 'Studio Ghibli').first # encontra o studio ghibli na database
        movies.each do |movie| # trata cada entry como seu proprio objeto similar a um foreach
           ghibli_movie = Movie.new # cria um novo filme
           ghibli_movie.title = movie['title']
           ghibli_movie.release_date = movie['release_date']
           ghibli_movie.description = movie['description']
           ghibli_movie.score = movie['rt_score']
           ghibli_movie.studio_id = studio.id
           ghibli_movie.save # salva o filme na database
        end 
        
        return render json: movies.to_json, status: 200
    end

    # retorna os filmes da ghibli presentes na database deles
    def get_all_ghibli_movies
        uri = URI('https://ghibliapi.herokuapp.com/films/')
        movies = JSON.parse(Net::HTTP.get(uri))

        return render json: movies.to_json, status: 200
    end
end
