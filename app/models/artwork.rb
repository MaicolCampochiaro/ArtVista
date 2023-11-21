class Artwork < ApplicationRecord
  belongs_to :user
  has_many :artwork_tags
  has_many :tags, trhought: :artwork_tags
end
