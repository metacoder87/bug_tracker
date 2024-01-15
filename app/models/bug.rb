class Bug < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :delete_all
    has_many :replies, dependent: :delete_all

    enum priority: { low: 0, medium: 1, high: 2 }
    enum status: { active: 0, in_progress: 1, solved: 2 }, _default: 'active'
end