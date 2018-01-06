class CreateDishLists < ActiveRecord::Migration
  def change
    create_table :dish_lists do |t|
      t.string :dish_names
      t.string :dish_desc
      t.string :cuisine

      t.timestamps

    end
  end
end
