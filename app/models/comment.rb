class Comment < ApplicationRecord
  belongs_to :bug
  belongs_to :user

  validates :location, :description, presence: true
  validates :user, presence: true

  scope :by_date, -> { order(created_at: :desc) }
  
end
