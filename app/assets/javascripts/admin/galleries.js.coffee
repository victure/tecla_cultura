# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#gallery_form").live "ajax:beforeSend", (evt, xhr, settings) ->
    #show some loading message
    console.log "sending..."
    $("#uploading_photos_container").hide()

  $("#gallery_form").live "ajax:success", (evt, data, status, xhr) ->
    console.log ""
    $("#uploading_photos_container").append data
    $(this).hide()
    $("#uploading_photos_container").show()
  $('#new_photo_for_gallery').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#progress-container').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      console.log("Entrando a Progress bar....")
      if data.context
        console.log("Progress bar....")
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
      else
        console.log("No context seted")