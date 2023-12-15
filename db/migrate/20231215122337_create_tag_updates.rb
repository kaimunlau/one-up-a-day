class CreateTagUpdates < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_updates do |t|
      t.integer :tag_id, null: false
      t.integer :update_id, null: false

      t.timestamps
    end
  end
end
