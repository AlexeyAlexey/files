class FileFolder < ActiveRecord::Base
  belongs_to :folder


  def store(io_file)
     begin
       self.name = io_file.original_filename
       self.save!
       root = User.current.folders.where("id = folder_id").first

       if root.id == self.folder_id
         path = File.join(Folder::USER_FILE_ROOT, root.id.to_s, self.id.to_s)
       else
        path = File.join(Folder::USER_FILE_ROOT, root.id.to_s, self.folder_id.to_s, self.id.to_s)
       end
  	   File.open(path, "wb") { |f| f.write(io_file.read) }
  	   return true
     rescue Exception => e
     	 self.errors.add(:base, 'Could not create file')
       return false
     end
  end
end
