class AddDetailToChalieViceItem < ActiveRecord::Migration[5.0]
  def change
    add_column :chalie_vice_items, :detail, :text, after: :description
  end
end
