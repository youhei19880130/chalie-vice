class CreateMakers < ActiveRecord::Migration[5.0]
  def change
    create_table :makers do |t|
      t.string :name, nil: false
      t.string :person, nil: false
      t.string :email, nil: false
      t.string :tel
      t.string :tel_person
      t.string :condition
      t.string :payment_site
      t.string :closing_date
      t.string :bank_name
      t.string :branch_name
      t.string :bank_account_type
      t.string :bank_account_number
      t.text :remarks

      t.timestamps
    end
  end
end
