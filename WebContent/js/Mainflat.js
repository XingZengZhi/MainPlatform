$(function(){
	var $link = $("#link span");//导航栏链接
	var $rea = $("#re a");//维修种类按钮
	var action = $("#mb form").attr("action");//取出添加报修项目的action路径
	var FixClass = {
			"网络故障维修" : 1,
			"办公设备报修" : 2,
			"后勤维修" : 3,
			"多媒体设备报修" : 4
	};
	$link.click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		
		var id = $(this).prop("id")
		
		id = id.split("_");
		
		$("#"+id[1]).fadeIn().siblings().fadeOut();
	});
	
	var index;
	$rea.click(function(){
		$("#mb").fadeIn();//蒙板显示
		index = FixClass[$(this).children("span").text()];//根据报修项目的名称找对应的值
		var newAction = action + "?FixIndex=" + index; //拼接action，使用新的变量名避免了更改action值的尴尬
		$("#mb form").attr("action", newAction);//重新设置action路径
	});
	
	$("#eqSave input[type='submit']").click(function(){
		$.post(action,{
			"FixIndex":index,
			"eqName":$("input[name='eq_name']").val(),
			"eqSpace":$("input[name='eq_space']").val(),
			"eqMessage":$("textarea[name='eq_message']").val()
		},function(data){
			$("#eq_tip").stop().fadeIn(0).text(data).fadeOut(1000);
		},"text");
		return false;
	});
	
	$("#close").click(function(){
		$("#mb").fadeOut();
	});
	
	$("#forgetPass").click(function(){
		$("#forPass").stop().fadeToggle();
	});
	
	$("#reg").click(function(){
		$("#registForm").fadeIn();
		$("#loginForm").fadeOut();
		$("#la img").fadeOut();
	});
	
	$("#loginSpan").click(function(){
		$("#registForm").fadeOut();
		$("#loginForm").fadeIn();
		$("#la img").fadeIn();
	});
	
//	注册验证
	$("#registForm input[type='text']").blur(function(){
		checkName($(this));
	});
	
	$("#registForm input[type='password']:eq(0)").blur(function(){
		checkPass($(this));
	});
	
	$("#loginForm input[type='text']").blur(function(){
		checkName($(this));
	});
	
	$("#loginForm input[type='password']:eq(0)").blur(function(){
		checkPass($(this));
	});
	
	$("#forPass input[type='text']").blur(function(){
		checkName($(this));
	});
	
	$("#forPass input[type='password']:eq(0)").blur(function(){
		checkPass($(this));
	});
	
	function checkName(e){//验证用户名
		var reg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
		if(reg.test(e.val())){
			e.siblings("p:eq(0)").css("color","#ccc");
			return true;
		}else{
			e.siblings("p:eq(0)").css("color","red");
			return false;
		}
	}
	//校验密码
	function checkPass(e){
		var reg = /^(\w){6,20}$/;
		if(reg.test(e.val())){
			e.siblings("p:eq(1)").css("color","#ccc");
			return true;
		}else{
			e.siblings("p:eq(1)").css("color","red");
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
	//注册按钮提交
	$("#registForm input[type='submit']").click(function(){
		var username = $("#username").val();
		var userpassword = $("#userpassword").val();
		var sha = hex_sha1(userpassword);
		if(username == "" || userpassword == ""){
			alert("用户名或密码不能为空");
			return false;
		}else{
			//再一次校验用户名和密码
			if(!checkName($("#username")) || !checkPass($("#userpassword"))){
				alert("用户名或密码不合法");
				return false;
			}
			if(!comparePass($("#userpassword"), $("#relpass"))){
				alert("两次不密码一致");
				return false;
			}
		}
		$("#userpassword").val(sha);
	});
	//忘记密码按钮提交
	$("#forPass input[type='submit']").click(function(){
		var forname = $("#forname").val();
		var forpassword = $("#forpassword").val();
		var sha = hex_sha1(forpassword);
		if(forname == "" || forpassword == ""){
			alert("用户名或密码不能为空");
			return false;
		}else{
			//再一次校验用户名和密码
			if(!checkName($("#forname")) || !checkPass($("#forpassword"))){
				alert("用户名或密码不合法");
				return false;
			}
			if(!comparePass($("#forpassword"), $("#reforpassword"))){
				alert("两次不密码一致");
				return false;
			}
		}
		$("#forpassword").val(sha);
	});
	//登录按钮提交
	$("#loginForm input[type='submit']").click(function(){
		//非空校验
		var loginname = $("#loginname").val();
		var loginpass = $("#loginpass").val();
		var src = $("#headImage").attr("src").substring($("#headImage").attr("src").lastIndexOf('/')+1, $("#headImage").attr("src").length);
		var sha = hex_sha1(loginpass); //密码加密
		if(loginname == "" || loginpass == ""){
			alert("用户名或密码不能为空");
			return false;
		}else{
			//再一次校验用户名和密码
			if(!checkName($("#loginname")) || !checkPass($("#loginpass"))){
				alert("用户名或密码不合法");
				return false;
			}
		}
		$("#loginpass").val(sha);
	});
	
	var RequestAction = action.substring(0, action.lastIndexOf("/") + 1);
	var RequestParameter = {
			p1:"1",
			p2:"2",
			p3:"3",
			p4:"4",
	};
	var Datas = {
			data1:"data-1",
			data2:"data-2",
			data3:"data-3",
			data4:"data-4"
	};
	//网络故障维修列表
	GetTable(RequestParameter.p1, 1, Datas.data1);
	FindClassPageBtn(RequestParameter.p1, 1, $("#Table_Fix_1 .icon_left"), $("#Table_Fix_1 .icon_right"));
	var e = 1;
	$("#Table_Fix_1 .icon_left").click(function(){
		GetTable(RequestParameter.p1, --e, Datas.data1);
		PageIndex(e, $("#"+Datas.data1));
		FindClassPageBtn(RequestParameter.p1, e, $("#Table_Fix_1 .icon_left"), $("#Table_Fix_1 .icon_right"));
	});
	$("#Table_Fix_1 .icon_right").click(function(){
		GetTable(RequestParameter.p1, ++e, Datas.data1);
		PageIndex(e, $("#"+Datas.data1));
		FindClassPageBtn(RequestParameter.p1, e, $("#Table_Fix_1 .icon_left"), $("#Table_Fix_1 .icon_right"));
	});
	//结束
	//办公设备维修列表
	GetTable(RequestParameter.p2, 1, Datas.data2);
	FindClassPageBtn(RequestParameter.p2, 1, $("#Table_Fix_2 .icon_left"), $("#Table_Fix_2 .icon_right"));
	var e2 = 1;
	$("#Table_Fix_2 .icon_left").click(function(){
		GetTable(RequestParameter.p2, --e2, Datas.data2);
		PageIndex(e2, $("#"+Datas.data2));
		FindClassPageBtn(RequestParameter.p2, e2, $("#Table_Fix_2 .icon_left"), $("#Table_Fix_2 .icon_right"));
	});
	$("#Table_Fix_2 .icon_right").click(function(){
		GetTable(RequestParameter.p2, ++e2, Datas.data2);
		PageIndex(e2, $("#"+Datas.data2));
		FindClassPageBtn(RequestParameter.p2, e2, $("#Table_Fix_2 .icon_left"), $("#Table_Fix_2 .icon_right"));
	});
	//结束
	//办公设备维修列表
	GetTable(RequestParameter.p3, 1, Datas.data3);
	FindClassPageBtn(RequestParameter.p3, 1, $("#Table_Fix_3 .icon_left"), $("#Table_Fix_3 .icon_right"));
	var e3 = 1;
	$("#Table_Fix_3 .icon_left").click(function(){
		GetTable(RequestParameter.p3, --e3, Datas.data3);
		PageIndex(e3, $("#"+Datas.data3));
		FindClassPageBtn(RequestParameter.p3, e3, $("#Table_Fix_3 .icon_left"), $("#Table_Fix_3 .icon_right"));
	});
	$("#Table_Fix_3 .icon_right").click(function(){
		GetTable(RequestParameter.p3, ++e3, Datas.data3);
		PageIndex(e3, $("#"+Datas.data3));
		FindClassPageBtn(RequestParameter.p3, e3, $("#Table_Fix_3 .icon_left"), $("#Table_Fix_3 .icon_right"));
	});
	//结束
	//办公设备维修列表
	GetTable(RequestParameter.p4, 1, Datas.data4);
	FindClassPageBtn(RequestParameter.p4, 1, $("#Table_Fix_4 .icon_left"), $("#Table_Fix_4 .icon_right"));
	var e4 = 1;
	$("#Table_Fix_4 .icon_left").click(function(){
		GetTable(RequestParameter.p4, --e4, Datas.data4);
		PageIndex(e4, $("#"+Datas.data4));
		FindClassPageBtn(RequestParameter.p4, e4, $("#Table_Fix_4 .icon_left"), $("#Table_Fix_4 .icon_right"));
	});
	$("#Table_Fix_4 .icon_right").click(function(){
		GetTable(RequestParameter.p4, ++e4, Datas.data4);
		PageIndex(e4, $("#"+Datas.data4));
		FindClassPageBtn(RequestParameter.p4, e4, $("#Table_Fix_4 .icon_left"), $("#Table_Fix_4 .icon_right"));
	});
	//结束
	//分页按钮动画
	function PageIndex(index, PageNum){
		PageNum.parent().siblings("#pageNum").children("span").text(index);
	}
	function GetTable(p, pageIndex, Data){
		$("#"+ Data +" p:gt(0)").remove();
		$.post(RequestAction + "eq_FindClass", {
			"class_id":p,
			"pageSize":8,
			"pageIndex":pageIndex
		},function(data){
			for(var i = 0;i<data.length;i++){
				if(data[i].user == null){
					username = "无";
				}else{
					username = data[i].user.uname;
				}
				if(data[i].fixer == null){
					fixname = "无";
				}else{
					fixname = data[i].fixer.fix_name;
				}
				if(data[i].eq_sta == 2){
					status = "正在维修";
				}else if(data[i].eq_sta == 1){
					status = "维修成功";
				}else{
					status = "维修失败";
				}
				$("#" + Data).append("<p>"+
						"<span>"+ data[i].eq_id +"</span>" +
						"<span>"+ username +"</span>" +
						"<span>"+ data[i].eq_name +"</span>" +
						"<span>"+ data[i].eq_fixtime +"</span>" +
						"<span>"+ fixname +"</span>" +
						"<span>"+ status +"</span>" +
						"</p>");
			}
		},"json");
	}
	
	function FindClassPageBtn(p, pageIndex, btnleft, btnright){
		$.post(RequestAction + "eq_FindClassPageIndex", {
			"class_id":p,
			"pageSize":8,
			"pageIndex":pageIndex
		},function(data){
			if(data == "0"){
				btnright.fadeIn(0);
				btnleft.fadeOut(0);
			}else if(data == "1"){
				btnright.fadeIn(0);
				btnleft.fadeIn(0);
			}else if(data == "2"){
				btnright.fadeOut(0);
				btnleft.fadeIn(0);
			}else{
				btnright.fadeOut(0);
				btnleft.fadeOut(0);
			}
		},"text");
	}
	
});
