class ChangeSchemaFromChalieViceItemImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :chalie_vice_item_images, :url, :image
  end
end
