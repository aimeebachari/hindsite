class Trip < ApplicationRecord
  belongs_to :event, foreign_key: "start_event_id"
  belongs_to :event, foreign_key: "end_event_id"

  validates :start_event_id, presence: true
  validates :end_event_id, presence: true
  validate :start_and_end_are_not_same

  def start_and_end_are_not_same
    if start_event_id == end_event_id
      errors.add(:end_event_id, "start and end can't be the same")
    end
  end
end
