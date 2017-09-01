class CreateChalieViceLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :chalie_vice_letters do |t|
      t.string :name, null: false
      t.string :category_name, null: false
      t.string :thumb_image_url, null:false
      t.text   :body
      t.string :url, null: false
      t.string :qr_code_url, null: false
      t.string :friend_name, default: ''
      t.string :friend_title, default: ''

      t.timestamps
    end
  end
end
