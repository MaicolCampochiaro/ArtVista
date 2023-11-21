class CreateArtworkTags < ActiveRecord::Migration[7.1]
  def change
    create_table :artwork_tags do |t|
      t.references :artwork, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
