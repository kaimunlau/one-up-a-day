class UpdateUpdatePosts < ActiveRecord::Migration[7.1]
  def change
    rename_table :updates, :update_posts
    rename_table :tag_updates, :tag_update_posts
    rename_column :tag_update_posts, :update_id, :update_post_id
  end
end
