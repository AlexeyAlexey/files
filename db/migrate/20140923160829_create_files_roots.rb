class CreateFilesRoots < ActiveRecord::Migration
  def change
    create_table :files_roots do |t|

      t.timestamps
    end
  end
end
