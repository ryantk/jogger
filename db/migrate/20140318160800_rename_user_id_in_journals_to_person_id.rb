class RenameUserIdInJournalsToPersonId < ActiveRecord::Migration
  def change
    rename_column :journals, :user_id, :person_id
  end
end
