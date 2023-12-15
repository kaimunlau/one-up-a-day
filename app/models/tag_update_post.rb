class TagUpdatePost < ApplicationRecord
  belongs_to :update_post
  belongs_to :tag

  validates :update_post, presence: true
  validates :tag, presence: true
end
