class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :nick
      t.integer :age

      t.timestamps
    end
  end
end
