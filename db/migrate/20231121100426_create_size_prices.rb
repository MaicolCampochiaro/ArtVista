class CreateSizePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :size_prices do |t|
      t.string :size
      t.float :price
      t.references :artwork, null: false, foreign_key: true

      t.timestamps
    end
  end
end
