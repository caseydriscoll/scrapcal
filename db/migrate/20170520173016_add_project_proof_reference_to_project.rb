class AddProjectProofReferenceToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :projectproof_id, :integer, references: :projectproof
    remove_column :projects, :projectprint_id, :integer
  end
end
