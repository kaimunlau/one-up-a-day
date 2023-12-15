class AddDateToUpdates < ActiveRecord::Migration[7.1]
  def change
    add_column :updates, :date, :date
  end
end
