class StudioController < ApplicationController

    skip_before_action :verify_authenticity_token

    def list
        @studios = Studio.all;
        return render json: @studios.to_json, status: 200
    end
    
    def show
        @studio = Studio.find(params[:id]);
        return render json: @studio.to_json, status: 200
    end
    
    def create
        @studio = Studio.new(studio_params)

        if @studio.save
            return render json: @studio.to_json, status: 200
        else
            return render json: {
                error: "could not create studio"
            },  status: 400
        end

    end

    def studio_params
        params.permit(:name, :foundation)
    end
    
    def update
        @studio = Studio.find(params[:id])

        if @studio.update_attributes(studio_params)
            return render json: @studio.to_json, status: 200
        else
            return render json: {
                error: "could not update studio"
            },  status: 400
        end
    end
    
    def delete
        Studio.find(params[:id]).destroy
        @studios = Studio.all
        return render json: @studios.to_json, status: 200
    end

    def show_movies_of_studio
        @studio = Studio.find(params[:id])
        @movies = @studio.movies
        if @movies
            return render json: @movies.to_json, status: 200
        else
            return render json: {
                error: "could not find movies"
            },  status: 400
        end
    end
end
