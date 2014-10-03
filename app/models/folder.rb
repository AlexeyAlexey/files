class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :file_folders

  has_many :subfolders, class_name: "Folder", foreign_key: "folder_id", dependent: :destroy
  belongs_to :folder, class_name: "Folder"

  USER_FILE_ROOT = Rails.root + "user_file_root"

  

  def create_root_folder
    begin
      self.name = "root"
      self.save!
    
      directory = File.join(USER_FILE_ROOT, self.id.to_s)
      Dir.mkdir(directory)
        
      self.folder_id = self.id
      self.save!
        
    rescue Exception => e
      self.errors.add(:base, 'Could not create root directory') 
    end    
  end

  
  def create_folder
  	begin
  	  @root = User.current.folders.where("id == folder_id").first
      directory = File.join(USER_FILE_ROOT, @root.id.to_s, self.id.to_s)
      Dir.mkdir(directory)  		
  	rescue Exception => e
  	  self.errors.add(:base, 'Could not create root directory')
  	end
  end
end
