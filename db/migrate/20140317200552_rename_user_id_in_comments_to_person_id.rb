class RenameUserIdInCommentsToPersonId < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :person_id
  end
end
