$(document).ready(function() {
	
	/*$("#leftsidebar, .column, #sidebar, #main").height(($(document).height() - 541)+'px');*/

	$("#leftsidebar, .column, #sidebar, #main").height($(document).height());
	
	
	
	$('#featured li').hover(function(){
		$(this).find('span').animate({bottom:'6px'}, {queue: false});
	}, function(){
		$(this).find('span').animate({bottom:'-73px'}, {queue: false});
	});
});


$('.imgswitch ').click(function(){
        $('#imgswitch').slideToggle();
 });