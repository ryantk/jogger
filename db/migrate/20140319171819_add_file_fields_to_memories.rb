class AddFileFieldsToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :uploaded, :boolean
    add_column :memories, :filename, :string
  end
end
