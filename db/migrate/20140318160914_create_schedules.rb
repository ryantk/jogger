class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.integer :person_id

      t.timestamps
    end
  end
end
