class CreatePrintPhotos < ActiveRecord::Migration[5.0]
  def change
    create_join_table :prints, :photos do |t|

      t.timestamps
    end
  end
end
