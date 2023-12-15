class Update < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
  validates :date, presence: true, uniqueness: { scope: :user, message: 'You can only post one update per day' }
end
