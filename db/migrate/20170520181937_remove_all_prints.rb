class RemoveAllPrints < ActiveRecord::Migration[5.0]
  def change
    drop_table :photos_prints
    drop_table :project_prints
    drop_table :prints
  end
end
