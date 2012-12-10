$(document).ready ->
  $("#dp").datepicker()
  $("#tp").timepicker defaultTime: "value"
  $("#event_place_id").bind "change", ->
    $("#event_map_zoom").val("")
    $("#event_map_latlng").val("")
  $(".toggle-place").bind "click", ->
    display = $(this).data("display")
    hide = $(this).data("hide")
    toogle_map = $("#map-place").data("visible") * 1
    $("#" + display).css "display", "block"
    $("#" + hide).css "display", "none"
    if toogle_map < 0
      $("#map-place").css "display", "block"
      $("#event_map_zoom").val(map.getZoom())
      $("#event_map_latlng").val(map.markers[0].getPosition().toString())
    else
      $("#map-place").css "display", "none"
    toogle_map = toogle_map * -1
    $("#map-place").data("visible",toogle_map)
    false