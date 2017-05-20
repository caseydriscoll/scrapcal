class CreateProofs < ActiveRecord::Migration[5.0]
  def change
    create_table :proofs do |t|
      t.string :title

      t.timestamps
    end
  end
end
