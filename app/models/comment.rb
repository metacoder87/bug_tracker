class Comment < ApplicationRecord
  belongs_to :bug

  validates :body, presence: true
end
