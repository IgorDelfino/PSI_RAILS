class MovieController < ApplicationController

    skip_before_action :verify_authenticity_token

    def list
        @movies = Movie.all
        return render json: @movies.to_json, status:200
    end
    
    def show
        @movie = Movie.find(params[:id])
        return render json: @movie.to_json, status: 200
    end
    
    # def new
    #     @movie = Movie.new
    #     @studios = Studio.all 
    # end
    
    def create
        @movie = Movie.new(movie_params)

        if @movie.save
            return render json: @movie.to_json, status: 200
        else
            #something
        end

    end

    def movie_params
        params.permit(:title, :release_date, :description, :genre, :esrb, :studio_id)
    end
    
    # def edit
    #     @movie = Studio.find(params[:id])
    # end
    
    def update
        @movie = Movie.find(params[:id])

        if @movie.update_attributes(movie_params)
            return render json: @movie.to_json, status:200
        else 
            #idk a lot about error handling in rails
        end
    end
    
    def delete
        Movie.find(params[:id]).destroy
        @movies = Movie.all
        return render json: @movies.to_json, status: 200
    end

    def show_studio_of_movie
        @movie = Movie.find(params[:id])
        @studio = @movie.studio
        return render json: @studio.to_json, status: 200
    end 
end

