class CreateProjectPrints < ActiveRecord::Migration[5.0]
  def change
    create_join_table :project, :prints do |t|

      t.timestamps
    end
  end
end
