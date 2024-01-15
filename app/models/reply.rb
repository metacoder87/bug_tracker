class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :bug

  validates :body, :comment_id, :bug_id, :user_id, presence: true 
end
