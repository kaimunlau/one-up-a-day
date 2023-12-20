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
      send_success_response(@update_post)
    else
      send_failure_response(@update_post)
    end
  end

  private

  def update_post_params
    params.require(:update_post).permit(:title, :content)
  end

  def send_success_response(update_post)
    respond_to do |format|
      format.html { redirect_to update_posts_path }
      format.json { render json: update_post }
    end
  end

  def send_failure_response(update_post)
    flash.alert = @update_post.errors[:date].first if @update_post.errors[:date].present?
    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: update_post.errors, status: :unprocessable_entity }
    end
  end
end
