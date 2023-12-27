class RemoveDefaultFromFirstNameInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :first_name, nil
  end
end
