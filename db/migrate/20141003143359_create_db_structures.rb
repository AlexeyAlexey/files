class CreateDbStructures < ActiveRecord::Migration
  def change
    create_table :db_structures do |t|

      t.timestamps
    end
  end
end
