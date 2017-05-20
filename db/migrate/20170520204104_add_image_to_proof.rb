class AddImageToProof < ActiveRecord::Migration[5.0]
  def change
    add_column :proofs, :image, :string
  end
end
