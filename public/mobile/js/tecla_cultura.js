var map;
function bind_handlers(){
	$("#prev-month").live("click",function(){
		month= $(this).data("month")
		route = $(this).attr("href") + "&month=" + month 
		$.get(route,function(data){
			try{
				//$(".week-rows").hide();
				$(".week-rows").html(data);//.trigger("create");
				//$(".week-rows").show();
				prev_month = $("#prev-month-hidden").val();
				$("#prev-month").data("month", prev_month);
				next_month = $("#next-month-hidden").val();
				$("#next-month").data("month", next_month);
				$("#month").text($("#label-month-hidden").val())
			}
			catch(err){
				console.log(err)
			}
		})
		return false
	});

	$("#next-month").live("click",function(){
		month= $(this).data("month")
		route = $(this).attr("href") + "&month=" + month  
		$.get(route,function(data){
			try{
				//$(".week-rows").hide();
				$(".week-rows").html(data);//.trigger("create");
				//$(".week-rows").show();
				prev_month = $("#prev-month-hidden").val();
				$("#prev-month").data("month", prev_month);
				next_month = $("#next-month-hidden").val();
				$("#next-month").data("month", next_month);
				$("#month").text($("#label-month-hidden").val())

			}
			catch(err){
				console.log(err)
			}
		})
		return false
	});
	$('.gallery-page').live('pageshow', function(e){
		$("#gallery a").photoSwipe({});				
		return true;
	});

	$("#map-page").live("pageshow", function(){
		$.getJSON("/mobile_app/map.json", function(data){
			map = new GMaps({
        			div: '#map',
        			lat: 13.67527,
        			lng: -89.28572
      			});
      		$.each(data,function(key,value){
      			alert(value.lat)
      			map.addMarker({
        			lat: value.lat,
        			lng: value.lng,
        			title: value.name,
        			infoWindow: {
          				content: '<h4>'+value.name+'</h4></br><p>'+value.description+'</p>'
        			}
      			});
      		})
		})
		return true;
	})
	
}
$(document).on("ready", bind_handlers)