class UpdatePost < ApplicationRecord
  before_validation :set_date

  belongs_to :user
  has_many :tag_update_posts
  has_many :tags, through: :tag_update_posts

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
  validates :date, presence: true, uniqueness: { scope: :user, message: 'You can only post one update per day' }

  def set_date
    self.date = Date.today if date.blank?
  end
end
