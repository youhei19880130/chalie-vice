class AddShipFromLocationFromMaker < ActiveRecord::Migration[5.0]
  def change
    add_column :makers, :ship_from_location, :integer, limit: 2, after: :bank_account_number, default: 0
  end
end
