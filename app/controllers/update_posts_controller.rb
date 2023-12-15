class UpdatePostsController < ApplicationController
  def index
    @update_posts = UpdatePost.all.order(date: :desc)
    @dates = @update_posts.pluck(:date).uniq
  end
end
