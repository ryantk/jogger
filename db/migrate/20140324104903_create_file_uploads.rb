class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :name
      t.integer :filesize

      t.timestamps
    end
  end
end
