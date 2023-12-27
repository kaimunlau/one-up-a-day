class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tags = Tag.order(:title)
    @dates = @tags.map { |tag| tag.update_posts.pluck(:date) }.flatten.uniq
    respond_to do |format|
      format.html
      format.json { render json: @tags.map(&:title) }
    end
  end
end
