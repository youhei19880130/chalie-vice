class RenameItemIdandLetterIdFromChalieViceLetterItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :chalie_vice_letter_items, :items_id, :item_id
    rename_column :chalie_vice_letter_items, :letters_id, :letter_id
  end
end
