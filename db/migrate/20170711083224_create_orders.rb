class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_code, nil: false
      t.integer :branch_no, nil: false
      t.integer :chalievice_item_id, nil: false
      t.string :item_name, nil: false
      t.string :receiver_zip_code, nil: false
      t.string :receiver_address, nil: false
      t.string :receiver_name, nil: false
      t.string :receiver_tel, nil: false
      t.string :remarks, nil: false
      t.string :delivery_company_code
      t.string :delivery_slip_code

      t.timestamps
    end
  end
end
