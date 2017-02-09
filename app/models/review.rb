class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :comments
  
  validates :body, presence: true
end
