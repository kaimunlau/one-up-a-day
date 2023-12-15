class UpdatePostsController < ApplicationController
  def index
    @update_posts = UpdatePost.all.order(date: :desc)
  end
end
