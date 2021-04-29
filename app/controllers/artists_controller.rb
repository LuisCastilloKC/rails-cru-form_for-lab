class ArtistsController < ApplicationController
    def show
      find_artist(params)
    end
  
    def new
      @artist = Artist.new
    end
  
    def create
      artist = Artist.create(artist_params)
      redirect_to artist_path(artist) 
    end
  
    def edit
      find_artist(params)
    end
  
    def update
      find_artist(params).update(artist_params)
      redirect_to artist_path(@artist)
    end
  
    private
  
    def artist_params
      params.require(:artist).permit(:name, :bio)
    end
  
    def find_artist(params)
      @artist = Artist.find(params[:id])
    end
  end