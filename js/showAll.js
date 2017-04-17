$(function() {
	var sl = $("#tb #sl");
	sl.click(function() {
		$(this).text("受理成功").css("background-color", "deepskyblue").parent()
				.parent().slideUp(1300);
	});
	// 处理待受理表单分页
	var len;
	var allpage = document.getElementById("allpage");
	var forms = document.getElementById("tb").getElementsByTagName("form");
	var clone_forms = forms;
	if (forms.length % 12 == 0) {
		len = forms.length / 12;
	} else {
		len = ((forms.length / 12) + 1);
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
		$(forms).remove();
		$.ajax({
			type : "POST",
			url : "/MainPlatform/showAllPage",
			dataType : "text",
			data : "pageIndex=" + pageIndex,
			success : function(data) {
				$("#tb").append(data);
			}
		});
	}
	/*--------------------------------*/
});