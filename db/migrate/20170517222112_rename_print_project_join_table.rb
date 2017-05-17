class RenamePrintProjectJoinTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :prints_project, :project_prints
  end
end
