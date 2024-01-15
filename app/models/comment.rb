class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bug

  has_many :replies, dependent: :destroy

  validates :body, :bug_id, :user_id, presence: true 
end
