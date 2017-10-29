class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def search
    if params[:search].present?
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end

  def index
  	# @movies = Movie.all
     @movies = Movie.search(page: params[:page], per_page: 10)
  end

  def show
    @reviews = Review.where(:movie_id => @movie.id)
    if @reviews.blank?
    @avg_rating = 0
    else
      @avg_rating =@reviews.average(:rating).round(2)
    end

  end


  def new
    @movie = current_user.movies.build
  end

  def edit
  end


  def create
    @movie = current_user.movies.build(movie_params)
      if @movie.save
      	flash[:notice]='Movie was successfully created.'
      	redirect_to movies_path
      else
        render 'new'
      end
    
  end


  def update
      if @movie.update(movie_params)
        flash[:notice]='Movie was successfully updated.'
      	redirect_to movies_path
      else
        redirect_to edit_movie_path(@movie)
      end
  
  end

  def destroy
    @movie.destroy
      flash[:notice]='Movie was successfully deleted.'
      redirect_to movies_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
    end
end
