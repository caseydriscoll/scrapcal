class AddLeftAndRightPhotosToProofs < ActiveRecord::Migration[5.0]
  def change
    add_column :proofs, :left_photo_id, :integer, references: :photos
    add_column :proofs, :right_photo_id, :integer, references: :photos
  end
end
