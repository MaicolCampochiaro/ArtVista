class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.text :description
      t.string :image_url, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
