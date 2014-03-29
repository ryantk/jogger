class CreateAttachesMemories < ActiveRecord::Migration
  def change
    create_table :attaches_memories do |t|
      t.integer :memory_id
      t.string :memory_type
      t.integer :has_attachment_id
      t.string :has_attachment_type

      t.timestamps
    end
  end
end
