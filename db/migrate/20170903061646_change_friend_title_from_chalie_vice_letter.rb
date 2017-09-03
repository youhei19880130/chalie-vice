class ChangeFriendTitleFromChalieViceLetter < ActiveRecord::Migration[5.0]
  def up
   change_column :chalie_vice_letters, :friend_title, :text, default: nil
  end

  def down
   change_column :chalie_vice_letters, :friend_title, :string, default: ''
  end
end
