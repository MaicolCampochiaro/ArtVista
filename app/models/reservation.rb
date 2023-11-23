class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :status, inclusion: { in: %w(requested accepted denied) }
end
