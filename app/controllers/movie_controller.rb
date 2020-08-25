
class MovieController < ApplicationController

    skip_before_action :verify_authenticity_token

    def list
        movies = Movie.all
        return render json: movies.to_json, status:200
    end
    
    def show
        movie = Movie.find(params[:id])
        if movie
            return render json: movie.to_json, status: 200
        else
            return render json: {
                error: "could not find movie"
            },  status: 400
        end
    end
    
    def create
        movie = Movie.new(movie_params)

        if movie.save
            return render json: movie.to_json, status: 200
        else
            return render json: {
                error: "could not create movie"
            },  status: 400
        end

    end

    def movie_params
        params.permit(:title, :release_date, :description, :score, :studio_id)
    end
    
    def update
        movie = Movie.find(params[:id])

        if movie.update_attributes(movie_params)
            return render json: movie.to_json, status:200
        else 
            return render json: {
                error: "could not update movie"
            },  status: 400
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

end

