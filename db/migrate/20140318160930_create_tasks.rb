class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :due
      t.text :details
      t.integer :schedule_id

      t.timestamps
    end
  end
end
