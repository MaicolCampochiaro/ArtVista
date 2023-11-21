class SizePrice < ApplicationRecord
  belongs_to :artwork
  has_many :reservations
end
