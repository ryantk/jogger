class EditFileUploadsFields < ActiveRecord::Migration
  def change
    add_column :file_uploads, :path, :string
    rename_column :file_uploads, :filesize, :size
  end
end
