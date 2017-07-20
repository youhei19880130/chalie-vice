class AddColorAndSizeToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :color, :string, after: :name
    add_column :items, :size, :string, after: :name
  end
end
