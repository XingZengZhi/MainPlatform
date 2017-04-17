$(function(){
	// 处理待受理表单分页
	var len;
	var allpage = document.getElementById("allpage");
	var divs = document.getElementById("slSuccessBox").getElementsByTagName("div");
	if (divs.length % 9 == 0) {
		len = divs.length / 9;
	} else {
		len = ((divs.length / 9) + 1);
		len = len.toString().substring(0, len.toString().indexOf("."));
	}
	for (var i = 1; i <= len; i++) {
		if (i > 3)
			break;
		$("#as").append("<a>" + i + "</a>");
	}
	allpage.innerHTML = len;
	var as = document.getElementById("as").getElementsByTagName("a");
	for (var i = 0; i < as.length; i++) {
		as[i].onclick = function() {
			fucAjax(this.innerHTML);
		}
	}
	var leftBtn = document.getElementById("leftBtn");
	var rightBtn = document.getElementById("rightBtn");
	var items = document.getElementById("as").getElementsByTagName("a");
	leftBtn.onclick = function() {
		computer('-');
	}
	rightBtn.onclick = function() {
		computer('+');
	}
	function computer(ch) {
		if (len % 3 == 0) {
			forfunc(ch,3);
		} else {
			forfunc(ch,1);
		}
	}
	function forfunc(a,b){
		for (var i = 0; i < items.length; i++) {
			if (a == '-') {
				if (parseInt(items[items.length - 1].innerHTML) == 3)
					return;
				items[i].innerHTML = parseInt(items[i].innerHTML) - b;
			} else {
				if (parseInt(items[items.length - 1].innerHTML) == len)
					return;
				items[i].innerHTML = parseInt(items[i].innerHTML) + b;
			}
		}
	}
	var btn = document.getElementById("btn");
	btn.onclick = function(){
		var value = document.getElementById("txt");
		if(parseInt(value.value)>parseInt(allpage.innerHTML)){
			alert("您输入的值已超过总页数！");
		}else if(parseInt(value.value) <= 0 || value.value == ""){
			alert("您输入的数字不合法！");
		}
		else{
			fucAjax(parseInt(value.value));
		}
	}
	function fucAjax(pageIndex){
		$(divs).remove();
		$.ajax({
			type : "POST",
			url : "/MainPlatform/slAllPage",
			dataType : "text",
			data : "pageIndex=" + pageIndex,
			success : function(data) {
				$("#slSuccessBox").append(data);
				abc();
			}
		});
	}
	abc();
	function abc(){
		$success = $("#slSuccessBox #success");
		$del = $("#slSuccessBox #del");
		var flag = 1;
		$success.each(function(){
			if($(this).prop("name") == 1){
				$(this).text("修理成功").css({
					"background-color":"rgb(0,219,0)",
					"border":"1px solid rgb(0,219,0)"
				});
			}
		});
		$success.bind("click",function(){
			if($(this).prop("name") == 1){
				$(this).unbind("click");
			}else{
				if(flag == 1){
					$(this).text("等待").animate({
						left:25,
					}).siblings().animate({
						left:105
					});
					flag = 0;
				}else{
					$(this).text("维修中...").animate({
						left:65,
					}).siblings().animate({
						left:215
					});
					flag = 1;
				}
			}
		});
		$del.click(function(){
			$.ajax({
				type:"GET",
				url:"/MainPlatform/delSuccessServlet",
				data:"eqID="+$(this).parent().siblings("#eqID").text()
			});
			$(this).text("修理成功").animate({
				left:65,
			}).siblings().animate({
				left:215
			});
		});
	}
});