class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.date :release_date
      t.string :rating
      t.string :imdb_rating
      t.string :run_time

      t.timestamps
    end
  end
end
