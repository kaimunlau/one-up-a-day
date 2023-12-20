class TagUpdatePostsController < ApplicationController
  def add_tags
    update_post = UpdatePost.find(params[:id])
    tags = params[:tags]

    errors = handle_tags(tags, update_post)

    if errors.empty?
      render json: { status: :ok }
    else
      render json: { status: :unprocessable_entity, errors: }
    end
  end

  private

  def handle_tags(tags, update_post)
    errors = []
    tags.each do |tag|
      create_new_tag(tag) if Tag.find_by(title: tag).nil?
      tag_update_post = TagUpdatePost.new(tag: Tag.find_by(title: tag), update_post:)
      errors << tag_update_post.errors unless tag_update_post.save
    end
    errors
  end

  def create_new_tag(tag)
    new_tag = Tag.new(title: tag)
    new_tag.save
  end
end
