class AddUserIdToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :user_id, :integer
  end
end
