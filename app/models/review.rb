class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :body, presence: true
end
