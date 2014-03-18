class AddMemoryHolderTypeToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :memory_holder_type, :string
  end
end
