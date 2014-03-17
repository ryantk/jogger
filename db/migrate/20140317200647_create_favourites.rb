class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :favourable_id
      t.string :favourable_type
      t.integer :person_id

      t.timestamps
    end
  end
end
