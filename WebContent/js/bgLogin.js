$(document).ready(function(){
	//注册和登录间的切换
	var $have = $("#have");
	var $rg = $("#rg");
	$have.click(function(){
		var dis = $("#login").css("display");
		if(dis = "none"){
			$("#tip").fadeOut();
			$("#login").fadeIn(500);
			$("#register").fadeOut(500);
		}
	});
	$rg.click(function(){
		var dis = $("#register").css("display");
		if(dis = "none"){
			$("#tip").fadeOut();
			$("#login").fadeOut(500);
			$("#register").fadeIn(500);
		}
	});
	//记住我按钮滑动
	$("#remeber").click(function(){
		var left = $(this).children("i").css("left");
		if(left == '0px'){
			$(this).children("i").animate({
				left:61+'%'
			},500,function(){
				$(this).parent().css("background-color","#8CB66E");
			});
			//添加记住我的
			$(this).prop("title",1);
		}else{
			$(this).children("i").animate({
				left:0+'%'
			},500,function(){
				$(this).parent().css("background-color","#CBCBCB");
			});
			//不记住我
			$(this).prop("title",0);
		}
	});
	//验证登录的用户名和密码是否合法
	check($("#uName"), $("#uPass"));
	//验证注册的用户名和密码是否合法
	check($("#ruName"), $("#ruPass"));
	var $loginBtn = $("#loginBtn"); //获取登录按钮JQUERY对象
	var $registerBtn = $("#registerBtn"); //获取注册按钮JQUERY对象
	//登录按钮提交
	$loginBtn.click(function(){
		//非空校验
		var uName = $("#uName").val();
		var uPass = $("#uPass").val();
		var src = $("#headImage").prop("src").substring($("#headImage").prop("src").lastIndexOf('/')+1, $("#headImage").prop("src").length);
		var sha = hex_sha1(uPass); //密码加密
		if(uName == "" || uPass == ""){
			alert("用户名或密码不能为空");
			return false;
		}else{
			//再一次校验用户名和密码
			if(!checkName($("#uName")) || !checkPass($("#uPass"))){
				alert("用户名或密码不合法");
				return false;
			}
		}
		//拼接action链接，解决多个form表单提交的问题
		/*var ac = $("#loginForm").prop("action");
		$("#loginForm").prop("action",ac + "?uName=" + uName + "&uPass=" + sha + "&uImg=" + src + "&remeber=" + $("#remeber").prop("title"));*/
	});
	//注册按钮提交
	$registerBtn.click(function(){
		var ruName = $("#ruName").val();
		var ruPass = $("#ruPass").val();
		var sha = hex_sha1(ruPass);
		if(ruName == "" || ruPass == ""){
			alert("用户名或密码不能为空");
			return false;
		}else{
			//再一次校验用户名和密码
			if(!checkName($("#ruName")) || !checkPass($("#ruPass"))){
				alert("用户名或密码不合法");
				return false;
			}
			if(!comparePass($("#ruPass"), $("#ruPassword"))){
				alert("两次不密码一致");
				return false;
			}
		}
		/*var ac = $("#registerForm").prop("action");
		$("#registerForm").prop("action",ac + "?ruName=" + ruName + "&ruPass=" + sha);*/
	});
	//失去焦点开始执行
	function check(e1, e2){
		//失去焦点校验登录名：只能输入5-20个以字母开头、可带数字、“_”、“.”的字串 
		e1.blur(function(){
			checkName(e1);
		});
		//失去焦点校验密码：只能输入6-20个字母、数字、下划线
		e2.blur(function(){
			checkPass(e2);
		});
	}
	//校验用户名
	function checkName(e){
		var reg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
		if(reg.test(e.val())){
			$("#tip").fadeOut();
			return true;
		}else{
			if(e.prop("id") == "uName"){ //登录用户名的提示
				$("#tip").text("只能输入5-20个以字母开头、可带数字、“_”、“.”的字串").append("<i></i>").animate({
					top:-58 + 'px'
				}).fadeIn();
			}else{ //注册用户名的提示
				$("#tip").text("只能输入5-20个以字母开头、可带数字、“_”、“.”的字串").append("<i></i>").animate({
					top:-40 + 'px'
				}).fadeIn();
			}
			return false;
		}
	}
	//校验密码
	function checkPass(e){
		var reg = /^(\w){6,20}$/;
		if(reg.test(e.val())){
			$("#tip").fadeOut();
			return true;
		}else{
			if(e.prop("id") == "uPass"){ //登录密码的提示
				$("#tip").text("只能输入6-20个字母、数字、下划线").append("<i></i>").animate({
					top: 10 + 'px'
				}).fadeIn();
			}else{ //注册密码的提示
				$("#tip").text("只能输入6-20个字母、数字、下划线").append("<i></i>").animate({
					top: 26+ 'px'
				}).fadeIn();				
			}
			return false;
		}
	}
	//比较注册的两个密码是否一致
	function comparePass(es1, es2){
		if(es1.val() == es2.val()){
			return true;
		}else{
			return false;
		}
	}
	
	//点击切换头像
	$("#headImage").click(function(){
		var href = $("#headImage").prop("src"); //获取初始链接
		var last = href.lastIndexOf('/'); //获取最后一个/符号的下标
		href = href.substring(0, last); //将src进行切割
		var newHeadImage = Math.random() * 10; //随机生成0-9随机数
		href = href + "/head_" + Math.floor(newHeadImage) + ".jpg"; //Math.floor取等于参数值的最大整数
		$("#headImage").prop("src", href);
	});
});
