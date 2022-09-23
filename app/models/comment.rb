class Comment < ApplicationRecord
  belongs_to :bug

  validates :body, presence: true

  default_scope { order(created_at: :desc) }
  
end
