class AddFirstNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false, default: 'First Name'
  end
end
