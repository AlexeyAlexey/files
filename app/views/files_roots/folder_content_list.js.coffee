$("#nav_upload_file").attr("current_folder_id", "<%= @root.id %>")
$("#nav_new_folder").attr("current_folder_id", "<%= @root.id %>")
$("#folder_content").attr("current_folder_id", "<%= @root.id %>")
$("#folder_content #folder_content_list").html("<%= escape_javascript(render 'folder_content_list', locals: {title: @root.name.upcase}) %>")

$("#folder_content #files_list").html("<%= escape_javascript(render 'file_folders/files_list') %>")