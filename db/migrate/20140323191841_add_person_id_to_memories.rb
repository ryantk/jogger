class AddPersonIdToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :person_id, :integer
  end
end
