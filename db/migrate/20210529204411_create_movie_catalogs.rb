class CreateMovieCatalogs < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_catalogs do |t|
      t.datetime :time
      t.numeric :price
      t.integer :movie_id

      t.timestamps
    end
  end
end
