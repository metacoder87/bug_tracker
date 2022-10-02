class Comment < ApplicationRecord
  belongs_to :bug

  validates :location, :description, presence: true

  scope :by_date, -> { order(created_at: :desc) }
  
end
