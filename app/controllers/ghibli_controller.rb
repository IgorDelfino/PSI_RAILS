require 'net/http'
require 'json'

class GhibliController < ApplicationController
    # add all ghibli movies to the database under the id of studio ghibli(wich is seeded to be number 1)
    # its pratically a seeder for studio ghibli films
    def add_ghibli_movies_to_database
        uri = URI('https://ghibliapi.herokuapp.com/films/') # this is the api's address with the route films(used to return all films)
        movies = JSON.parse(Net::HTTP.get(uri)) # this function is used to parse our result into a JSON for easier manipulation and so that we can return the JSON by the end
        studio = Studio.where(name: 'Studio Ghibli').first # gets the studio ghibli entry in the database
        movies.each do |movie| # treats each entry as its own object, think of it as the foreach in php
           ghibli_movie = Movie.new # creates a new Movie object
           ghibli_movie.title = movie['title']
           ghibli_movie.release_date = movie['release_date']
           ghibli_movie.description = movie['description']
           ghibli_movie.score = movie['rt_score']
           ghibli_movie.studio_id = studio.id
           ghibli_movie.save # saves the Movie
        end 
        
        return render json: movies.to_json, status: 200
    end

    # return all ghibli movies (simple use of an api made for info about Studio ghibli)
    def get_all_ghibli_movies
        uri = URI('https://ghibliapi.herokuapp.com/films/')
        movies = JSON.parse(Net::HTTP.get(uri))

        return render json: movies.to_json, status: 200
    end
end
