class Comment < ApplicationRecord
  belongs_to :bug

  validates :body, presence: true

  scope :by_date, { order(created_at: :desc) }
  
end
