class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :caption
      t.references :user, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
