require 'net/http'
require 'json'

class MovieController < ApplicationController

    skip_before_action :verify_authenticity_token

    def list
        movies = Movie.all
        return render json: movies.to_json, status:200
    end
    
    def show
        movie = Movie.find(params[:id])
        return render json: movie.to_json, status: 200
    end
    
    # def new
    #     @movie = Movie.new
    #     @studios = Studio.all 
    # end
    
    def create
        movie = Movie.new(movie_params)

        if movie.save
            return render json: movie.to_json, status: 200
        else
            #something
        end

    end

    def movie_params
        params.permit(:title, :release_date, :description, :score, :studio_id)
    end
    
    # def edit
    #     @movie = Studio.find(params[:id])
    # end
    
    def update
        movie = Movie.find(params[:id])

        if movie.update_attributes(movie_params)
            return render json: movie.to_json, status:200
        else 
            #idk a lot about error handling in rails
        end
    end
    
    def delete
        Movie.find(params[:id]).destroy
        movies = Movie.all
        return render json: movies.to_json, status: 200
    end

    def show_studio_of_movie
        movie = Movie.find(params[:id])
        studio = movie.studio
        return render json: studio.to_json, status: 200
    end
    
    def add_ghibli_movies_to_database
        uri = URI('https://ghibliapi.herokuapp.com/films/')
        movies = JSON.parse(Net::HTTP.get(uri))
        movies.each do |movie|
           ghibli_movie = Movie.new
           ghibli_movie.title = movie['title']
           ghibli_movie.release_date = movie['release_date']
           ghibli_movie.description = movie['description']
           ghibli_movie.score = movie['rt_score']
           ghibli_movie.studio_id = 1
           ghibli_movie.save
        end 
        
    end
end

