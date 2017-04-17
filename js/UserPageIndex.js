/**
 *  前台主页js
 */
$(function(){
	$("input").attr("autocomplete","off");
	//显示登录窗口和蒙板
	$("#login").click(function(){
		$("#loginBox").show(200);
		$("#mb").show();
	});
	//关闭登录窗口和蒙板
	$("#loginBox #del").click(function(){
		$("#loginBox").hide();
		$("#mb").hide();
		$("#loginBox input:not(input[type='submit'])").val("");
		$("#loginBox #message").text("");
	});
	
	$("#addDiv input,#addDiv textarea").focus(function(){
		$(this).css("border","1px solid red");
	}).blur(function(){
		$(this).css("border","1px solid #ccc");
	});
	
	//获得当前时间
	$("#addDiv input[name='fixTime']").click(function(){
		var time = new Date();
		var hour = time.getHours();
		var minutes = time.getMinutes();
		var seconds = time.getSeconds();
		if(minutes < 10){
			minutes = "0"+minutes;
		}
		if(seconds < 10){
			seconds = "0"+seconds;
		}
		 $(this).val(time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+hour+":"+minutes+":"+seconds);
	});
	
	//添加项目表单提交按钮事件
	$("#addSubmit").click(function(){
		if($("#loginName").text() == ""){
			alert("请先登录！");
			return false;
		}
		if($("input[name='eqName']").val() == ""||$("input[name='fixTime']").val() == ""||$("textarea[name='fixMessage']").val() == ""){
			$("#mess").stop(true).fadeIn(100).text("抱歉，设备名、维修时间、维修信息均不能为空！").fadeOut(1000);
			return false;
		}else {
			$.ajax({
				type:"post",
				url:"/MainPlatform/addServlet",
				data:"tName="+$("#addDiv input[name='tName']").val()+
						"&eqName="+$("input[name='eqName']").val()+
							"&fixTime="+$("input[name='fixTime']").val()+
								"&fixMessage="+$("textarea[name='fixMessage']").val()+
									"&eqSpace="+$("input[name='eqSpace']").val(),
				success:function(data){
					$("#mess").stop(true).fadeIn(100).text(data).fadeOut(3000);
				},
				error:function(data){
					$("#mess").stop(true).fadeIn(100).text(data).fadeOut(3000);
				},
			});
		}
		$("input[name='eqName']").val("");
		$("input[name='fixTime']").val("");
		$("textarea[name='fixMessage']").val("");
		$("input[name='eqSpace']").val("");
		return false;
	});
	
	//响应事件
	var person = $("a[name='person']"); //个人信息修改超链接
	var personMsg = $("#personMsg"); //个人信息修改盒子
	
	var addFix = $("a[name='addFix']"); //添加项目超链接超链接
	var addDiv = $("#addDiv"); //添加项目盒子
	
	$fixSta1 = $("a[name='fixSta']"); //项目进度
	$fixSta2 = $("#fixSta");
	
	person.click(function(){
		if($("#loginName").text() == ""){
			alert("请先登录！");
			return false;
		}
		personMsg.show().siblings().hide();
	});
	
	addFix.click(function(){
		addDiv.show().siblings().hide();
	});
	//项目维修进度事件
	var fixflag = 1;
	var len = 0;
	var pag_len = 0;
	$fixSta1.click(function(){
		if($("#loginName").text() == ""){
			alert("请先登录！");
			return false;
		}
		var username = $("#loginName").text();
		$fixSta2.show().siblings().hide();
		if(fixflag == 1){
			$.ajax({
				type:"POST",
				dataType:"text",
				url:"/MainPlatform/fixSta",
				data:"username="+username,
				success:function(data){
					$("#fixContent").append(data);
				}
			});
			//获得总的数据数量
			$.ajax({
				type:"GET",
				dataType:"text",
				url:"/MainPlatform/fixSta",
				data:"username="+username,
				success:function(data){
					len = data;
					if((len % 8) == 0){
						pag_len = len / 8;
					}else{
						pag_len = (len / 8) + 1;
					}
					var numArr = pag_len.toString().split(".");
					for(var i = 2;i<=numArr[0];i++){
						$("#Labels").append("<span>"+i+"</span>");
					}
					//分页按钮事件，查询该用户下的所有以报修的设备
					$("#Labels span").click(function(){
						$("#fixContent p:gt(0)").remove();
						var t = $(this).text();
						$.ajax({
							type:"GET",
							dataType:"text",
							url:"/MainPlatform/page",
							data:"title="+t+"&username="+username,
							success:function(data){
								$("#fixContent").append(data);
							}
						});
					});
					//分页左右按钮事件
					$left = $("#pre");
					$right = $("#nex");
					var slen = numArr[0]-3;
					var leftFlag = 0,rightFlag = 1;
					$left.click(function(){
						if(leftFlag == slen){
							return false;
						}else{
							leftFlag++;
						}
						$(this).siblings("#lab").children("#Labels").animate({
							left:"-" + (leftFlag*31)
						});
					});
					$right.click(function(){
						if(leftFlag == 0){
							return false;
						}else{
							leftFlag--;
						}
						$(this).siblings("#lab").children("#Labels").animate({
							left:"-" + (leftFlag*31)
						});
					});
					/*----------------over------------------*/
				}
			});
			fixflag = 0;
		}else{
			return false;
		}
	});
	
	
	//判断用户登录名是否存在
	var username = $("input[name='tname']");
	username.blur(function(){
		$.ajax({
			type:"POST",
			dataType:"text",
			url:"/MainPlatform/loginAjax",
			data:"username="+username.val(),
			success:function(data){
				$("#message").text(data);
			}
		});
	});
	
	//修改个人信息事件
	$chname = $("#chName");
	$chtel = $("#chTel");
	$ch = $("#ch");
	var flag = 1;
	var name = "";
	$chname.click(function(){
		if(flag == 1){
			$(this).siblings("input[type='text']").prop("readonly","").css("color","#333");
			name = $(this).siblings("input[type='text']").val();
			$(this).text("取消");
			flag = 0;
		}else{
			$(this).siblings("input[type='text']").prop("readonly","readonly").css("color","#ccc");
			$(this).siblings("input[type='text']").val(name);
			$(this).text("修改");
			name = "";
			flag = 1;
		}
	});
	var tel = "";
	var gold = 1;
	$chtel.click(function(){
		if(gold == 1){
			$(this).siblings("input[type='text']").prop("readonly","").css("color","#333");
			tel = $(this).siblings("input[type='text']").val();
			$(this).text("取消");
			gold = 0;
		}else{
			$(this).siblings("input[type='text']").prop("readonly","readonly").css("color","#ccc");
			$(this).siblings("input[type='text']").val(tel);
			$(this).text("修改");
			tel = "";
			gold = 1;
		}
	});
	
	$ch.click(function(){
		if((name == $chname.siblings("input[type='text']").val()) && (tel == $chtel.siblings("input[type='text']").val())){
			alert("未做任何修改");
			return false;
		}else if(name == "" & tel == ""){
			alert("未做任何修改");
			return false;
		}
		return true;
	});
});