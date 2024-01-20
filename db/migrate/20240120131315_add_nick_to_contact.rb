class AddNickToContact < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :nick, :string
  end
end
