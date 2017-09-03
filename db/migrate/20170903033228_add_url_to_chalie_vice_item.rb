class AddUrlToChalieViceItem < ActiveRecord::Migration[5.0]
  def change
    add_column :chalie_vice_items, :url, :string, after: :detail
  end
end
