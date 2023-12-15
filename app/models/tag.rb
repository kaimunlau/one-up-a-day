class Tag < ApplicationRecord
  has_many :tag_update_posts
  has_many :update_posts, through: :tag_update_posts

  validates :title, presence: true, uniqueness: true
end
