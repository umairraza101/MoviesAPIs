class RenameTableMovieRating < ActiveRecord::Migration[6.1]
  def change
    rename_table :movie_ratings, :ratings
  end
end
