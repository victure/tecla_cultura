// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require_tree .

function reload_multiuploader(){
	$('#new_photo_for_gallery').fileupload({
  dataType: "script",
  add: function(e, data) {
    var file, types;
    types = /(\.|\/)(gif|jpe?g|png)$/i;
    file = data.files[0];
    if (types.test(file.type) || types.test(file.name)) {
      data.context = $(tmpl("template-upload", file));
      $('#new_painting').append(data.context);
      return data.submit();
    } else {
      return alert("" + file.name + " is not a gif, jpeg, or png image file");
    }
  },
  progress: function(e, data) {
    var progress;
    if (data.context) {
      progress = parseInt(data.loaded / data.total * 100, 10);
      return data.context.find('.bar').css('width', progress + '%');
    }
  }
});
}
$(document).ready(function(){
	$("#gallery_form").live("ajax:beforeSend", function(evt, xhr, settings){
		//show some loading message
		$("#uploading_photos_container").hide()
	});
	$("#gallery_form").live("ajax:success", function(evt, data, status, xhr){
		$("#uploading_photos_container").load("/photos/new?multiple=true&gallery_id="+data.id)	
		$(this).hide()
		$("#uploading_photos_container").show();
	});
	$('#dp').datepicker();
	$('#tp').timepicker({defaultTime: 'value'  });
	$(".toggle-place").bind("click",function(){
		var display = $(this).data("display");
		var hide = $(this).data("hide");
		$("#"+display).css("display","inline-block")
		$("#"+hide).css("display","none")
		return false;
	})
})