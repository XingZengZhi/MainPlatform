/**
 * 维修页首页JS
 */
$(function(){
	$ind = $("#ind");
	$sl = $("#sl");
	$num = $(".headMidMsg #num");
	AjaxFunction($ind,"/MainPlatform/indexFixServlet");
	AjaxFunction($sl,"/MainPlatform/slSuccessServlet");
	AjaxFunction($num,"/MainPlatform/cglServlet");
	function AjaxFunction($a,Url){
		$.ajax({
			type:"POST",
			dataType:"text",
			url:Url,
			success:function(data){
				$a.text(data);
			}
		});
	}
	//未受理维修更多信息
	$.ajax({
		type:"POST",
		dataType:"text",
		url:"/MainPlatform/weisl",
		success:function(data){
			$("#moreresult1").append(data);
		}
	});
	//当前受理维修更多信息
	$.ajax({
		type:"POST",
		dataType:"text",
		url:"/MainPlatform/dqsl",
		success:function(data){
			$("#moreresult2").append(data);
		}
	});
	
	$(".headLeftMsg,.headMidMsg,.headRightMsg").mouseover(function(){
		$(this).children("#more").stop().fadeIn(500);
	}).mouseout(function(){
		$(this).children("#more").stop().fadeOut(500);
	});
	
	//历史成功记录
	$hisMsg = $("#hisMsg");
	$ul = $("#hisMsg ul");
	var lis = document.getElementById("hisMsg").getElementsByTagName("li");
	var h = $ul.height() - $hisMsg.height();
	var flag = true;
	var time;
	time = setInterval(ai(),8000);
	function ai(){
		if(flag){
			$ul.delay(1000).animate({
				marginTop:"-" + h + "px"
			},lis.length * 1000);
			flag = false;
		}else{
			$ul.delay(1000).animate({
				marginTop:"0px"
			},lis.length * 1000);
			flag = true;
		}
		setInterval(ai(),1000);
	}
	
});