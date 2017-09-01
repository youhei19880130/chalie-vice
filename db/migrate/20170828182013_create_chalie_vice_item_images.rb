class CreateChalieViceItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :chalie_vice_item_images do |t|
      t.references :item, index: true
      t.string :url, null: false

      t.timestamps
    end
  end
end
