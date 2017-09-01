class CreateChalieViceLetterItems < ActiveRecord::Migration[5.0]
  def change
    create_table :chalie_vice_letter_items do |t|
      t.references :letters, index: true
      t.references :items, index: true

      t.timestamps
    end
  end
end
