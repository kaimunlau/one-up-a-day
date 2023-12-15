class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :title, null: false, default: 'Tag'

      t.timestamps
    end
  end
end
