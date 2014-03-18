class AddMemoryHolderIdToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :memory_holder_id, :integer
  end
end
