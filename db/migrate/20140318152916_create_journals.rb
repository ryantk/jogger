class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
