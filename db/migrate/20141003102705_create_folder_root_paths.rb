class CreateFolderRootPaths < ActiveRecord::Migration
  def change
    create_table :folder_root_paths do |t|
      t.belongs_to :user
      t.belongs_to :folder
      t.string     :path
      t.string     :server


      t.timestamps
    end
    add_index :folder_root_paths, :user_id
    add_index :folder_root_paths, :folder_id
  end
end
