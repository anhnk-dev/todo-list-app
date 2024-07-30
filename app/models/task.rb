class Task < ApplicationRecord
  enum priority: %i(low medium high)

  belongs_to :user

  validates :title, :priority, :due_date, presence: true
end
