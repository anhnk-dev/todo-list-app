class Task < ApplicationRecord
  enum priority: %i(low medium high)

  belongs_to :user

  validates :title, :priority, :due_date, presence: true
  validates :priority, inclusion: { in: Task.priorities }
  validates :due_date, comparison: { greater_than: Time.zone.now, message: "can not be in the past" }, on: :create

  scope :incomplete, -> { where(completed: [nil, false]) }

  def completed!
    update(completed: true)
  end
end
