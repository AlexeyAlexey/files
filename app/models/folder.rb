class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :folder_root_paths
  has_many :file_folders


  has_many :subfolders, class_name: "Folder", foreign_key: "folder_id", dependent: :destroy
  belongs_to :folder, class_name: "Folder"

  USER_FILE_ROOT = Rails.root + "user_file_root"

  

  def create_root_folder
    begin
      self.name = "root"
      self.save!   
      self.folder_id = self.id
      self.save!
       
      folder_root_path = self.folder_root_paths.new
      folder_root_path.server = "root"
      folder_root_path.user_id = self.user_id
      folder_root_path.save!
      root_path = File.join(USER_FILE_ROOT, folder_root_path.id.to_s)
      folder_root_path.path = root_path
      folder_root_path.save!     
      Dir.mkdir(root_path) 
    rescue Exception => e
      self.errors.add(:base, 'Could not create root directory') 
    end    
  end

  
  #def create_folder
  #	begin
  #	  @root = User.current.folders.where("id == folder_id").first
  #    directory = File.join(USER_FILE_ROOT, @root.id.to_s, self.id.to_s)
  #    Dir.mkdir(directory)  		
  #	rescue Exception => e
  #	  self.errors.add(:base, 'Could not create root directory')
  #	end
  #end
end
