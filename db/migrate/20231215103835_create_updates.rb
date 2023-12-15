class CreateUpdates < ActiveRecord::Migration[7.1]
  def change
    create_table :updates do |t|
      t.string :title, null: false, default: 'Title'
      t.text :content, null: false, default: 'Content'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
