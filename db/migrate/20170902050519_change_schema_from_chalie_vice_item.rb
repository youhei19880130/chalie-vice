class ChangeSchemaFromChalieViceItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :chalie_vice_items, :thumb_image_url, :string
  end
end
