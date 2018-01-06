class CreateBookmarkedVenues < ActiveRecord::Migration
  def change
    create_table :bookmarked_venues do |t|
      t.integer :dish_id
      t.integer :venue_id

      t.timestamps

    end
  end
end
