class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, nil: false
      t.integer :chalievice_item_id, nil: false
      t.integer :maker_id, nil: false
      t.string :category, nil: false
      t.string :jan_code, nil: false
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
