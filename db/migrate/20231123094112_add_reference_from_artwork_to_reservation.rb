class AddReferenceFromArtworkToReservation < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :artwork, null: false, foreign_key: true
  end
end
