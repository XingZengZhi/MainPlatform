/**
 * 注册页JS（教师注册、修理工注册）
 */
$(function(){
	$("input[type='text']").prop("autocomplete","off");
	var submit1 = $("input[name='submit1']");
	var submit2 = $("input[name='submit2']");
	var testTel = /1[3|5|7|8|][0-9]{9}/; //验证手机号码
	var testName =/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/; //字母开头，允许5-16字节，允许字母数字下划线
	var flag1 = false,flag2 = false,flag3 = false,flag4 = false,flag5 = false,flag6 = false;
	//用户名失去焦点自动判断
	$("input[name='username'],input[name='ygusername']").blur(function(){
		var path,tp,dt;
		if(testName.test($(this).val()) && $(this).val()!=""){
			if($(this).prop("name") == "username"){
				tp = "POST";
				path = "/MainPlatform/registerAjax";
				dt = "username="+$(this).val();
				$.ajax({
					type:tp,
					url:path,
					data:dt,
					success:function(data){
						$("#unMsg").text(data);
						if(data === "该用户名以被注册"){
							flag1 = false;
						}else{
							flag1 = true;
						}
					}
				});
			}else{
				tp = "GET";
				path = "/MainPlatform/registerAjax";
				dt = "ygusername="+$(this).val();
				$.ajax({
					type:tp,
					url:path,
					data:dt,
					success:function(data){
						$("#ygunMsg").text(data);
						if(data === "该用户名以被注册"){
							flag1 = false;
						}else{
							flag1 = true;
						}
					}
				});
			}
		}else{
			if($(this).val() == ""){
				if($(this).prop("name") == "username"){
					$(this).parent().siblings().children("#unMsg").text("用户名不能为空");
				}else{
					$(this).parent().siblings().children("#ygunMsg").text("用户名不能为空");
				}
				
			}else{
				if($(this).prop("name") == "username"){
					$(this).parent().siblings().children("#unMsg").text("用户名不合法");
				}else{
					$(this).parent().siblings().children("#ygunMsg").text("用户名不合法");
				}
				flag1 = false;
			}
		}
	});
	//电话框失去焦点自动判断
	$("input[name='tel'],input[name='ygtel']").blur(function(){
		if(testTel.test($(this).val()) && $(this).val()!=""){
			$(this).parent().siblings().children("#telMsg").text("验证通过");
			flag2 = true;
		}else{
			if($(this).val() == ""){
				$(this).parent().siblings().children("#telMsg").text("电话不能为空");
				flag2 = false;
			}else{
				$(this).parent().siblings().children("#telMsg").text("验证失败");
				flag2 = false;
			}
		}
	});
	//密码框失去焦点自动判断
	$("input[name='password'],input[name='ygpassword']").blur(function(){
		if($(this).val() == ""){
			$(this).parent().siblings().children("#pwMsg").text("密码不能为空");
			flag3 = false;
		}else{
			$(this).parent().siblings().children("#pwMsg").text("");
			flag3 = true;
		}
	});
	$("input[name='repassword']").blur(function(){
		if($(this).val() != $("input[name='password']").val()){
			$(this).parent().siblings().children("#repMsg").text("两次密码输入不一致");
			flag4 = false;
		}else{
			$(this).parent().siblings().children("#repMsg").text("");
			flag4 = true;
		}
	});
	$("input[name='reygpassword']").blur(function(){
		if($(this).val() != $("input[name='ygpassword']").val()){
			$(this).parent().siblings().children("#repMsg").text("两次密码输入不一致");
			flag5 = false;
		}else{
			$(this).parent().siblings().children("#repMsg").text("");
			flag5 = true;
		}
	});
	
	submit1.click(function(){
		if($("input[name='username']").val() == "" || $("input[name='password']").val() == "" || $("input[name='tel']").val() == ""){
			alert("请填写完整的信息！");
			return false;
		}
		if(flag1 && flag2 && flag3 && flag4){
			$("#unMsg").text("");
			$("#telMsg").text("");
			return true;
		}else{
			return false;
		}
	});
	
	submit2.click(function(){
		if($("input[name='ygusername']").val() == "" || $("input[name='ygpassword']").val() == "" || $("input[name='ygtel']").val() == ""){
			alert("请填写完整的信息！");
			return false;
		}
		if(flag1&&flag2&&flag3&&flag5){
			$("#unMsg").text("");
			$("#telMsg").text("");
			return true;
		}else{
			return false;
		}
		
	});
	
	//登录盒子动画
	var yg = $("#yg");
	var ul0 = $("#registerBox ul:eq(0)");
	var ul1 = $("#registerBox ul:eq(1)");
	var span1 = $("#changeRe span:nth-child(2)");
	var span2 = $("#changeRe span:nth-child(3)");
	var flag = 1;
	
	yg.click(function(){
		if(flag == 1){
			ul0.animate({
				left:-500
			},1000);
			ul1.animate({
				left:60
			},1000);
			span1.css("transform","rotate(-132deg)");
			span2.css("transform","rotate(-132deg)");
			$(this).text("教师注册");
			flag = 0;
		}else{
			ul0.animate({
				left:60
			},1000);
			ul1.animate({
				left:500
			},1000);
			span1.css("transform","rotate(44deg)");
			span2.css("transform","rotate(44deg)");
			$(this).text("维修员注册");
			flag = 1;
		}
	});
	
});