class AddHouseJanCodeToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :house_jan_code, :string, after: :jan_code
  end
end
