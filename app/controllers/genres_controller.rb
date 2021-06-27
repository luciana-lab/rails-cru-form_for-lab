class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def show
        genre_find_by_id
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to genre_path(@genre)
    end

    def edit
        genre_find_by_id
    end

    def update
        genre_find_by_id
        @genre.update(genre_params)
        redirect_to genre_path(@genre)
    end

    private
    def genre_params
        params.require(:genre).permit(:name)
    end

    def genre_find_by_id
        @genre = Genre.find_by_id(params[:id])
    end
end