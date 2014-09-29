# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


(($) ->

  create_new_folder = (current_folder_id) ->
    dialog_new_folder = $("#new_folder_dialog")
    dialog_new_folder.find("input[name='current_folder_id']").val(current_folder_id)
    dialog_new_folder.find("input[name='folder[name]']").val("")

    dialog_new_folder.dialog 
        dialogClass: 'referralDialog'
        autoOpen: true
        resizable: true
        modal: true
        

  $(document).ready( () ->
    $("#nav_new_folder").bind "click", (eventObject) ->
      current_folder_id = $(this).attr("current_folder_id");
      create_new_folder(current_folder_id);
    
    $("#new_folder").bind "submit", () ->
      $("#new_folder_dialog").dialog('close')

    $("#folder_content_list").on "contextmenu", "li a", (eventObject) ->
      eventObject.preventDefault()
           
      menu_over_folder_list = $(".menu_over_folder")
      menu_over_folder_list.attr("slected_folder_id", this.id)
      
      menu_over_folder_list.css
        display: "block"
        left: eventObject.pageX + "px"
        top:  eventObject.pageY + "px"
        
    $(document).bind "click", () ->
      $(".menu_over_folder").hide()  
     
    $("a.menu_over_folder_delete").bind "click", (eventObject) ->

      $(".menu_over_folder").hide()
      this.href="/files_roots/" + $(".menu_over_folder").attr("slected_folder_id")

  )

) jQuery
