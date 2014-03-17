class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :type

      t.timestamps
    end
  end
end
