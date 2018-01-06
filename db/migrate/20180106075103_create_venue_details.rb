class CreateVenueDetails < ActiveRecord::Migration
  def change
    create_table :venue_details do |t|
      t.string :venue_name
      t.string :venue_address

      t.timestamps

    end
  end
end
