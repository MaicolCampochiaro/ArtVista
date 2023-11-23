class AddSizePriceToArtworks < ActiveRecord::Migration[7.1]
  def change
    add_column :artworks, :size, :string
    add_column :artworks, :price, :float
  end
end
