class CreateMovieRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_ratings do |t|
      t.integer :rating
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
