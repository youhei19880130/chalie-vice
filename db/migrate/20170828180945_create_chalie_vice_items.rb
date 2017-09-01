class CreateChalieViceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :chalie_vice_items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :category_name, null: false
      t.text :description
      t.string :youtube_url
      t.string :thumb_image_url, null: false

      t.timestamps
    end
  end
end
