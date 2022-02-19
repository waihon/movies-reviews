class CreateMovieLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_locations do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
