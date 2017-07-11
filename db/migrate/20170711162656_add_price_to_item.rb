class AddPriceToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :price, :integer, after: :jan_code, nil: false
  end
end
