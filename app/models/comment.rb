class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bug

  validates :body, :bug_id, :user_id, presence: true 
end
