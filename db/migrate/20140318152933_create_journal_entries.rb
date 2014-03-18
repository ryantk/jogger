class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.integer :journal_id
      t.text :body

      t.timestamps
    end
  end
end
