class AddJoinTableProjectProof < ActiveRecord::Migration[5.0]
  def change
      create_join_table :project, :proofs do |t|

      t.timestamps
    end
  end
end
