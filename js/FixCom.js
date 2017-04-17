window.onload = function() {
	date1 = new Date();
	var time1 = document.getElementById("time1");
	var day = ["星期天","星期一","星期二","星期三","星期四","星期五","星期六"];
	time1.innerHTML = date1.getFullYear() + "年" + (date1.getMonth() + 1) + "月" + date1.getDate() + "日"+" "+day[date1.getDay()];
	
	//动态时钟
	var time = null;
	time = setTimeout(systime, 100);
	function systime() {
		date2 = new Date();
		var seconds,minutes;
		var time2 = document.getElementById("time2");
		if(date2.getSeconds() < 10){
			seconds = "0" + date2.getSeconds();
		}else{
			seconds = date2.getSeconds();
		}
		if(date2.getMinutes() < 10){
			minutes = "0" + date2.getMinutes();
		}else{
			minutes = date2.getMinutes();
		}
		time2.innerText = date2.getHours() + ":" + minutes + ":" + seconds;
		time = setTimeout(systime, 1000);
	}
	
	//用户设置
	var set = $("#userSet");
	var user = $("#user");
	
	user.hover(function(){
		set.show();
	});
	set.mouseover(function(){
		$(this).show();
	}).mouseout(function(){
		$(this).hide();
		user.css("border-bottom","none");
	});
	
	//导航栏选中状态
	var a = $("#nav ul li a");
	a.click(function(){
		$(this).css("background","rgba(102,102,102,0.7)").parent().siblings().children("a").css("background","none");
	});
	
	//控制分页
	var btn = $("#th #eqid");
	btn.click(function(){
		alert($(this).text());
	});
};