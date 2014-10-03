# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


(($) ->
  create_new_folder = (current_folder_id) ->
    dialog_new_folder = $("#new_folder_dialog")
    dialog_new_folder.find("input[name='current_folder_id']").val(current_folder_id)
    dialog_new_folder.find("input[name='folder[name]']").val("")

    dialog_new_folder.dialog 
        autoOpen: true
        resizable: true
        modal: true
        
  upload_file = (current_folder_id) ->
    dialog_new_file = $("#upload_file_dialog")
    dialog_new_file.find("input[name='current_folder_id']").val(current_folder_id)    
    dialog_new_file.dialog 
        autoOpen: true
        resizable: true
        modal: true
        close: () ->
          $(this).dialog( "destroy" );
            

  $(document).ready( () ->
    $("#nav_new_folder").bind "click", (eventObject) ->
      current_folder_id = $(this).attr("current_folder_id");
      create_new_folder(current_folder_id);
    
    $("#new_folder").bind "submit", () ->
      $("#new_folder_dialog").dialog('close')

    $("#nav_upload_file").click (eventObject) ->
      current_folder_id = $(this).attr("current_folder_id");
      upload_file(current_folder_id)

    $("#upload_file").bind "submit", () ->
      $("#upload_file_dialog").dialog("close");

    $("#folder_content_list").on "contextmenu", "li a", (eventObject) ->
      eventObject.preventDefault()           
      menu_over_folder_list = $(".menu_over_folder")
      menu_over_folder_list.attr("slected_folder_id", this.id)      
      menu_over_folder_list.css
        display: "block"
        left: eventObject.pageX + "px"
        top:  eventObject.pageY + "px"

    $('#files_list').on "contextmenu", "li a", (eventObject) ->
      eventObject.preventDefault()           
      menu_over_files_list = $(".menu_over_file")
      menu_over_files_list.attr("slected_file_id", this.id)      
      menu_over_files_list.css
        display: "block"
        left: eventObject.pageX + "px"
        top:  eventObject.pageY + "px"
        
    $(document).bind "click", () ->
      $(".menu_over_folder").hide()  
      $(".menu_over_file").hide()
     
    $(".menu_over_folder a.menu_over_folder_delete").bind "click", (eventObject) ->
      $(".menu_over_folder").hide()
      this.href="/files_roots/" + $(".menu_over_folder").attr("slected_folder_id")    
  )
) jQuery
