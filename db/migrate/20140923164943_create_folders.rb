class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.references :folder
      t.belongs_to :user
      t.string     :name
    
      t.timestamps
    end

    add_index :folders, :folder_id
  end
end
