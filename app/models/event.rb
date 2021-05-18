class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 255}
  validates :adress, presence: true
  validates :datetime, presence: true
end
