class CreateFileFolders < ActiveRecord::Migration
  def change
    create_table :file_folders do |t|
      t.belongs_to :folder
      t.string     :name
      t.timestamps
    end
    add_index :file_folders, :folder_id
  end

end
