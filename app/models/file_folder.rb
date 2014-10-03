class FileFolder < ActiveRecord::Base
  belongs_to :folder


  def store(io_file)
     begin
       ActiveRecord::Base.transaction do
         self.name = io_file.original_filename
         self.save!
         byebug
         root = User.current.folder_root_paths.first
         path = File.join(Folder::USER_FILE_ROOT, root.id.to_s, self.id.to_s)
         self.path = path
         self.save!
  	     File.open(path, "wb") { |f| f.write(io_file.read) }
       end
  	   return true
     rescue Exception => e
       return false
     end
  end
end
