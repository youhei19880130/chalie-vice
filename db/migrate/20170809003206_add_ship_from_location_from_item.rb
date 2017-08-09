class AddShipFromLocationFromItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :ship_from_location, :integer, limit: 2, after: :stock, default: 0
  end
end
