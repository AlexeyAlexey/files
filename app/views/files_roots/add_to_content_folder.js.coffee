li = $('<li id="<%= @add_folder.id %>"></li>')

a = $("<%= escape_javascript(link_to @add_folder.name, files_root_path(@add_folder.id), remote: true, id: @add_folder.id, :class => 'icon-folder-close') %>")
li.append(a)
$("#folder_content ul#folder_content_list").append(li)
