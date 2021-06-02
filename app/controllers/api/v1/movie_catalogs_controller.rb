class Api::V1::MovieCatalogsController < ApplicationController
  before_action :set_movie_catalog, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :validate_admin, only: [:create, :update, :destroy]

  # List Movie Catalog
  def index
    @movie_catalogs = MovieCatalog.all.to_json(include: { movie: { only: :name } })
    render json: { data: @movie_catalogs }, status: 200
  end

  # Create Movie Catalog
  def create
    @movie_catalog = MovieCatalog.new(catalog_params)
    if @movie_catalog.save
      render json: { message: "Record Created", data: @movie_catalog }, status: 200
    end
  end

  # Update Movie Catalog
  def update
    if @movie_catalog.update(catalog_params)
      render json: { message: "Record Updated", data: @movie_catalog }, status: 200
    else
      render json: { message: "Record not Updated" }, status: 422
    end
  end

  # Destroy Movie Catalog
  def destroy
    if @movie_catalog.destroy
      render json: { message: "Record Deleted" }, status: 200
    end
  end

  private

  # find movie catalog against a specific id
  def set_movie_catalog
    @movie_catalog = MovieCatalog.find(params[:id])
  end

  # params for creating a catalog
  def catalog_params
    params.permit(:movie_id, :price, :time)
  end
end
