class Trip < ApplicationRecord
  belongs_to :start_event, class_name: "Event"
  belongs_to :end_event, class_name: "Event"

  validates :name, presence: true
  validates :start_event, presence: true
  validates :end_event, presence: true
  validate :start_and_end_are_not_same

  def start_and_end_are_not_same
    if start_event == end_event
      errors.add(:end_event_id, ": start and end can't be the same")
    end
  end
end
