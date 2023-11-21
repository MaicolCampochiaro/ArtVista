class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :size_price
end
