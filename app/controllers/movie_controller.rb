
class MovieController < ApplicationController

    #essa linha foi usada para resolver um problema onde todas as funções davam um tipo de erro de não autorizado
    skip_before_action :verify_authenticity_token

    #lista todos os filmes da nossa database
    #funciona a partir da rota GET localhost:3000/movies/list
    def list
        movies = Movie.all
        return render json: movies.to_json, status:200
    end
    
    #retorna um filme especifico da nossa database
    #funciona a partir da rota GET localhost:3000/movies/show/{id}
    def show
        movie = Movie.find(params[:id])
        if movie
            return render json: movie.to_json, status: 200
        else
            return render json: {
                error: "could not find movie"
            },  status: 404
        end
    end
    
    #cria um novo filme na nossa database
    #funciona a partir da rota POST localhost:3000/movie/create
    #e recebe os seguintes campos (title e release date como strings, description como um text, score e studio_id como integers )
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


    #definição dos parametros do filme
    def movie_params
        params.permit(:title, :release_date, :description, :score, :studio_id)
    end
    
    #muda a informação de um certo filme
    #funciona a partir da rota PATCH localhost:3000/movie/update/{id}
    #pode receber os seguintes campos (title e release date como strings, description como um text, score e studio_id como integers )
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
    
    #deleta um certo filme do banco de dados
    #funciona a partir da rota DELETE localhost:3000/movie/delete/{id}
    def delete
        Movie.find(params[:id]).destroy
        movies = Movie.all
        return render json: movies.to_json, status: 200
    end

    #essa função retorna o studio de um certo filme
    #funciona a partir da rota GET localhost:3000/movie/{id}/studio
    def show_studio_of_movie
        movie = Movie.find(params[:id])
        studio = movie.studio
        return render json: studio.to_json, status: 200
    end

end

