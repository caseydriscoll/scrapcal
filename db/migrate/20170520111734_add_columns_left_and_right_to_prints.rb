class AddColumnsLeftAndRightToPrints < ActiveRecord::Migration[5.0]
  def change
    add_column :prints, :left_photo_id, :integer, references: :photos
    add_column :prints, :right_photo_id, :integer, references: :photos
  end
end
