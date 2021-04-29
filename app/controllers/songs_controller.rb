class SongsController < ApplicationController
    def index
      @songs = Song.all
    end
  
    def show
      find_song(params)
    end
  
    def new
      @song = Song.new
    end
  
    def create
      song = Song.create(song_params)
      redirect_to song_path(song) 
    end
  
    def edit
      find_song(params)
    end
  
    def update
      find_song(params).update(song_params)
      redirect_to song_path(@song)
    end
  
    private
  
    def song_params
      params.require(:song).permit(:name, :artist_id, :genre_id)
    end
  
    def find_song(params)
      @song = Song.find(params[:id])
    end
  end
  