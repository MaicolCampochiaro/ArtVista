class Artwork < ApplicationRecord
  belongs_to :user
  has_many :artwork_tags
  has_many :tags, through: :artwork_tags
  has_one_attached :image
  has_many :reservations
end
