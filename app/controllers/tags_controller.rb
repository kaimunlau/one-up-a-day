class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tags = Tag.all
    @dates = @tags.map { |tag| tag.update_posts.pluck(:date) }.flatten.uniq
  end
end
