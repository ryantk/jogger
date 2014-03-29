class AddTaggableTypeToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :taggable_type, :string
  end
end
