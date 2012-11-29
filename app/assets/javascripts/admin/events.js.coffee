$(document).ready ->
  $("#dp").datepicker()
  $("#tp").timepicker defaultTime: "value"
  $(".toggle-place").bind "click", ->
    display = $(this).data("display")
    hide = $(this).data("hide")
    $("#" + display).css "display", "inline-block"
    $("#" + hide).css "display", "none"
    false