class UpdatePostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @update_posts = UpdatePost.all.order(date: :desc)
    @dates = @update_posts.pluck(:date).uniq
  end

  def new
    @update_post = UpdatePost.new
  end

  def create
    @update_post = UpdatePost.new(update_post_params)
    @update_post.user = current_user

    if @update_post.save
      redirect_to update_posts_path
    else
      flash.alert = @update_post.errors[:date].first if @update_post.errors[:date].present?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def update_post_params
    params.require(:update_post).permit(:title, :content)
  end
end
