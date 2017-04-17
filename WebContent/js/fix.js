$(function(){
	//侧边栏点击事件
	$("#left_link li").click(function(){
		var li = $(this).attr("value");
		$("#link_"+li).fadeIn(0).siblings().fadeOut(0);
		$(this).addClass("active").siblings().removeClass("active");
		
	});
//	三条杠点击事件
	$("#selecting").click(function(){
		$("#selecting_item").stop().fadeToggle();
	});
	$("#person").click(function(){
		$("#person_setting").stop().fadeToggle();
	});
	$("#selecting_item p").click(function(){
		$("#selecting_item").fadeOut();
		$("#search").attr("placeholder", $(this).text());
	});
});
