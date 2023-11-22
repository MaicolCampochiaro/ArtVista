class RemoveImageFromArtworks < ActiveRecord::Migration[7.1]
  def change
    remove_column :artworks, :image_url, :string
  end
end
