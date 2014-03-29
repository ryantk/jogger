class AddFileIdToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :file_id, :integer
  end
end
