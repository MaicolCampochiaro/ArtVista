class CreateSizePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :size_prices do |t|
      t.string :size, null: false
      t.float :price, null: false
      t.references :artwork, null: false, foreign_key: true

      t.timestamps
    end
  end
end
