class GenresController < ApplicationController
    def show
      find_genre(params)
    end
  
    def new
      @genre = Genre.new
    end
  
    def create
      genre = Genre.create(genre_params)
      redirect_to genre_path(genre)
    end
  
    def edit
      find_genre(params)
    end
  
    def update
      find_genre(params).update(genre_params)
      redirect_to genre_path(@genre) 
    end
  
    private
  
    def genre_params
      params.require(:genre).permit(:name)
    end
  
    def find_genre(params)
      @genre = Genre.find(params[:id])
    end
  end