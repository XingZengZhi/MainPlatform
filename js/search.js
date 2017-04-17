/**
 * 搜索结果js事件
 */
$(function(){
	$a = $("#show_contents a");
	$show_message = $("#show_message");
	$btn = $("#btn");
	var action = $("form").prop("action");
	$("#show_contents span:odd").css("background","#fff");
	
	$a.click(function(){
		var pText = $(this).siblings("span").text();
		$.ajax({
			type:"GET",
			dataType:"text",
			url:action,
			data:"pText="+pText,
			success:function(data){
				var str = data;
				var strArr = data.split(",");
				$("#name").text(strArr[0]);
				$("#time").text(strArr[1].slice(0,strArr[1].length-2));
				$("#space").text(strArr[3]);
				$("#msg").text(strArr[2]);
			}
		});
		$show_message.show();
	});
	$btn.click(function(){
		$show_message.hide();
	});
});