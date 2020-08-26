class StudioController < ApplicationController

    #essa linha foi usada para resolver um problema onde todas as funções davam um tipo de erro de não autorizado
    skip_before_action :verify_authenticity_token

    #lista todos os studios na nossa database
    #funciona a partir da rota GET localhost:3000/studio/list
    def list
        @studios = Studio.all;
        return render json: @studios.to_json, status: 200
    end
    
    #mostra um certo studio 
    #funciona a partir da rota GET localhost:3000/studio/show/{id}
    def show
        @studio = Studio.find(params[:id]);
        return render json: @studio.to_json, status: 200
    end
    
    #cria um novo studio na nossa database
    #funciona a partir da rota POST localhost:3000/studio/create
    #e recebe os seguintes campos (name e foundation como string) 
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

    #definição dos parametros para a criação ou alteração de um studio
    def studio_params
        params.permit(:name, :foundation)
    end
    
    #modifica a informação do studio na database
    #funciona a partir da rota PATCH localhost:3000/studio/update/{id}
    #pode receber os campos name e foundation
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
    
    #deleta um studio da database
    #funciona a partir da rota DELETE localhost:3000/studio/delete/{id}
    def delete
        Studio.find(params[:id]).destroy
        @studios = Studio.all
        return render json: @studios.to_json, status: 200
    end

    #mostra todos os filmes de um certo studio
    #funciona a partir da rota GET localhost:3000/studio/{id}/movies
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
