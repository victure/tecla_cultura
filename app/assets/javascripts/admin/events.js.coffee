$(document).ready ->
  $("#dp").datepicker()
  $("#tp").timepicker defaultTime: "value"
  $(".toggle-place").bind "click", ->
    display = $(this).data("display")
    hide = $(this).data("hide")
    toogle_map = $("#map-place").data("visible") * 1
    $("#" + display).css "display", "inline-block"
    $("#" + hide).css "display", "none"
    if toogle_map < 0
      $("#map-place").css "display", "inline-block"
    else
      $("#map-place").css "display", "none"
    toogle_map = toogle_map * -1
    false