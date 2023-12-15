class MakeTitleAndContentNullableInUpdatePosts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :update_posts, :title, true
    change_column_null :update_posts, :content, true
    change_column_default :update_posts, :title, nil
    change_column_default :update_posts, :content, nil
  end
end
