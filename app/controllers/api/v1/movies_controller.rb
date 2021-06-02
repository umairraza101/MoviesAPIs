class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :rating]
  before_action :authenticate_user!, only: [:rating, :fetch]
  before_action :validate_admin, only: [:fetch]

  # show a single movie
  def show
    if @movie
      render json: { data: @movie }, status: 200
    end
  end

  # rating for a movie
  def rating
    @rating = @movie.ratings.new(rating_params)
    @rating.user_id = current_user.id
    if @rating.save
      render json: { message: "Rating Created", data: @rating }, status: 200
    else
      render json: { message: "Rating not Created" }, status: 422
    end
  end

  # fetch movies
  def fetch
    fnf_movies = ['tt0232500', 'tt0322259', 'tt0463985', 'tt1013752', 'tt1596343', 'tt1905041', 'tt2820852', 'tt4630562']
    FetchMovies.new(fnf_movies).fetch_movies
    render json: { message: "Movie Fetched" }, status: 200
  end

  private

  # find movie against a specific id
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def rating_params
    params.permit(:rating)
  end
end
