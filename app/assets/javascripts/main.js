$(document).ready(function(){
	height_content_div();
});

$(window).resize(function(){
	height_content_div();	
});

/********************************************************/
/*														*/
/*														*/
/*					Funciones Generales					*/
/*														*/
/*														*/
/********************************************************/
var height_window = $(window).height();
var width_window = $(window).width();


function height_content_div(){
	var height_container = $("div#main_container").height();
	if (height_container <= height_window){
		$("div#main_container").css({
			height:height_window - 130
		})
	};
	console.log(height_container);
	console.log(height_window);
}