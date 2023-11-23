class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :status, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :artwork, null: false, foreign_key: true

      t.timestamps
    end
  end
end
