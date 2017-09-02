class ChangeSchemaFromChalieViceLetter < ActiveRecord::Migration[5.0]
  def change
    rename_column :chalie_vice_letters, :thumb_image_url, :thumb_image
    remove_column :chalie_vice_letters, :qr_code_url, :string
  end
end
