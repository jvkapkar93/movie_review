class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie 
  before_action :authenticate_user!, except: [:index, :show]

 
  def index
  	@reviews = Review.all
     # @reviews = Review.search(page: params[:page], per_page: 10)
  end

  def show
  end


  def new
  	@review = Review.new
    # @reviews = current_user.reviews.build
  end

  def edit
  end


  def create
  	binding.pry
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	@review.movie_id = @movie.id
    # @review = current_user.reviews.build(review_params)
      if @review.save
      	flash[:notice]='Review was successfully created.'
      	redirect_to movie_path(@movie)
      else
        render 'new'
      end
    
  end


  def update
      if @review.update(review_params)
        flash[:notice]='Review was successfully updated.'
      	redirect_to movie_path(@movie)
      else
        redirect_to edit_review_path(@review)
      end
  
  end

  def destroy
    @review.destroy
      flash[:notice]='Review was successfully deleted.'
      redirect_to reviews_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
    	@movie = Movie.find(params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end

end
