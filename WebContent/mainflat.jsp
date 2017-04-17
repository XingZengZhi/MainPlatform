<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上报修平台</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Mainflat.css"/>
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/sha1.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/Mainflat.js" ></script>
		<script type="text/javascript">
			$(function(){
				$("#data-1 p:odd").css("background-color","#D9EDF7");
				
				$("#data-2 p:odd").css("background-color","#DFF0D8");
				
				$("#data-3 p:odd").css("background-color","#FCF8E3");
				
				$("#data-4 p:odd").css("background-color","#F2DEDE");
				var message = "${message}";
				if(message != ""){
					alert(message);
				}
				
				var username = "${user.uname}";
				if(username != ""){
					$("#se_data").fadeIn();
					$("#se > span").fadeOut();
					GetPage(1);
				}else{
					$("#se_data").fadeOut();
					$("#se > span").fadeIn();
				}
				//分页按钮点击事件
				var e = 1;
				$("#se_page_left").click(function(){
					if($(this).css("display") == "none"){
						return;
					}
					GetPage(--e);
				});
				$("#se_page_right").click(function(){
					if($(this).css("display") == "none"){
						return;
					}
					GetPage(++e);
				});
				
				function GetPage(e){
					$("#se_data p:gt(0)").remove();
					$.post("${pageContext.request.contextPath}/eq_FindEquipment",{
						"pageSize":8,
						"pageIndex":e,
						"userid":"${user.uid}"
					},function(data){
						var username,
						fixname,
						status;
						var kind = new Array(data.length);
						for(var i = 0;i<data.length;i++){
							kind[i] = data[i].eq_id;
							if(data[i].user == null){
								username = "无";
							}else{
								username = data[i].user.uname;
							}
							if(data[i].fixer == null){
								fixname = "无";
							}else{
								fixname = data[i].fix.fix_name;
							}
							if(data[i].eq_sta == 2){
								status = "正在维修";
							}else if(data[i].eq_sta == 1){
								status = "维修成功";
							}else{
								status = "维修失败";
							}
							
							$("#se_data").append("<p>"+
									"<span>"+ data[i].eq_id +"</span>" +
									"<span>"+ username +"</span>" +
									"<span>"+ data[i].eq_name +"</span>" +
									"<span>"+ data[i].eq_fixtime +"</span>" +
									"<span>"+ fixname +"</span>" +
									"<span>"+ status +"</span>" +
									"</p>");
						}
						//维修种类
						$.post("${pageContext.request.contextPath}/class_FindClassify",{
							"eq_id":kind.toString()
						},function(Classdata){
							for(var i = 0;i<Classdata.length;i++){
								$("#se_data p:eq("+(i+1)+")").append("<span>" + Classdata[i] + "</span>");
							}
						},"json");
						
					},"json");
					//翻页按钮控制
					$.post("${pageContext.request.contextPath}/eq_FindPageIndex",{
						"pageSize":8,
						"pageIndex":e,
						"userid":"${user.uid}"
					},function(data){
						if(data == "0"){
							$("#se_page_right").fadeIn(0);
							$("#se_page_left").fadeOut(0);
						}else if(data == "1"){
							$("#se_page_right").fadeIn(0);
							$("#se_page_left").fadeIn(0);
						}else if(data == "2"){
							$("#se_page_right").fadeOut(0);
							$("#se_page_left").fadeIn(0);
						}else{
							$("#se_page_right").fadeOut(0);
							$("#se_page_left").fadeOut(0);
						}
					},"text");
				}
			});
		</script>
	</head>
	<body>
		<div id="mb">
			<img src="${pageContext.request.contextPath }/imgs/close.png" id="close"/>
			<!--填写维修表单-->	
			<h3>填写报修单</h3>
			<form id="eqSave" action="${pageContext.request.contextPath }/eq_SaveEq?username=${user.uname}" method="post">
				<p><span>设备名</span><input type="text" name="eq_name" /></p>
				<p><span>维修点</span><input type="text" name="eq_space" /></p>
				<p><span>详情</span></p>
				<textarea name="eq_message" rows="5" cols="30"></textarea>
				<input type="submit" value="提交"/>
				<p id="eq_tip"></p>
			</form>
		</div>
		<div id="content">
			<div id="top">
				<div id="logo">
				</div>
				<div id="link">
					<span class="active" id="mid_re">报修信息登记</span>
					<span id="mid_se">维修进度</span>
					<c:if test="${not empty user }">
					<span id="username">欢迎您：${user.uname}</span>
					<a href="${pageContext.request.contextPath }/user_UserLoginOut">退出</a>
					</c:if>
					<c:if test="${empty user }">
					<span id="mid_la">用户登录</span>
					</c:if>
				</div>
			</div>
			<div id="mid">
				<div id="re">
					<a>
						<img src="${pageContext.request.contextPath }/imgs/one.png" />
						<span>网络故障维修</span>
					</a>
					<a>
						<img src="${pageContext.request.contextPath }/imgs/two.png" />
						<span>办公设备报修</span>
					</a>
					<a>
						<img src="${pageContext.request.contextPath }/imgs/three.png" />
						<span>后勤维修</span>
					</a>
					<a>
						<img src="${pageContext.request.contextPath }/imgs/four.png" />
						<span>多媒体设备报修</span>
					</a>
				</div>
				<div id="se">
					<span>暂无进度</span>
					<div id="se_data">
						<p>
							<span>编号</span><span>用户名</span><span>设备名</span><span>报修时间</span><span>维修员</span><span>状态</span><span>种类</span>
						</p>
						
						<div id="se_page">
							<span id="se_page_left"><img src="${pageContext.request.contextPath }/imgs/left.png"/></span>
							<span id="se_page_right"><img src="${pageContext.request.contextPath }/imgs/right.png"/></span>
						</div>
					</div>
				</div>
				<div id="la">
					<!--注册-->
					<form action="${pageContext.request.contextPath }/user_UserRegister" method="post" id="registForm">
						<p>5-20个以字母开头、可带数字、“_”、“.”</p>
						<input type="text" name="uname" id="username" placeholder="输入用户名" />
						<p>只能输入6-20个字母、数字、下划线</p>
						<input type="password" name="upassword" id="userpassword" placeholder="输入密码" />
						<input type="password" id="relpass" placeholder="确认密码" />
						<input type="submit" value="注册"/>
						<span id="loginSpan">登录</span>
					</form>
					<!--忘记密码表单-->
					<form action="${pageContext.request.contextPath }/user_UserUpdata" method="post" id="forPass">
						<p>5-20个以字母开头、可带数字、“_”、“.”</p>
						<input type="text" name="uname" id="forname" placeholder="输入用户名" />
						<p>只能输入6-20个字母、数字、下划线</p>
						<input type="password" name="upassword" id="forpassword" placeholder="输入新密码" />
						<input type="password" id="reforpassword" placeholder="确认密码" />
						<input type="submit" value="确定修改"/>
					</form>
					<!--头像-->
					<img src="${pageContext.request.contextPath }/imgs/1.jpg" id="headImage" />
					<!--登录表单-->
					<form action="${pageContext.request.contextPath }/user_UserLogin" method="post" id="loginForm">
						<p>5-20个以字母开头、可带数字、“_”、“.”</p>
						<input type="text" name="uname" id="loginname" placeholder="用户名" />
						<p>只能输入6-20个字母、数字、下划线</p>
						<input type="password" name="upassword" id="loginpass" placeholder="密码" />
						<input type="submit" value="登录"/>
						<span id="forgetPass">忘记密码</span>
						<span id="reg">注册</span>
					</form>
				</div>
			</div>
			<!--网络故障维修列表-->
			<div id="Fix_1">
				<h2>网络故障维修列表</h2>
				<i></i>
				<div id="Table_Fix_1">
					<!--箭头-->
					<span class="icon_left">
						<img src="${pageContext.request.contextPath }/imgs/left.png"/>
					</span>
					<span class="icon_right">
						<img src="${pageContext.request.contextPath }/imgs/right.png"/>
					</span>
					<!--结束-->
					<!--分页按钮-->
					<div id="pageNum">
						<span class="SetSize" id="page_1">1</span>
					</div>
					<!--结束-->
					<!--列表数据-->
					<div id="Table_data">
						<div id="data-1">
							<p>
								<span>编号</span><span>用户名</span><span>设备名</span><span>维修时间</span><span>维修员</span><span>状态</span>
							</p>
						</div>
					</div>
					<!--结束-->
				</div>
			</div>
			<!--办公设备报修-->
			<div id="Fix_2">
				<h2>办公设备报修列表</h2>
				<i></i>
				<div id="Table_Fix_2">
					<span class="icon_left">
						<img src="${pageContext.request.contextPath }/imgs/left.png"/>
					</span>
					<span class="icon_right">
						<img src="${pageContext.request.contextPath }/imgs/right.png"/>
					</span>
					<div id="pageNum">
						<span class="SetSize" id="page_1">1</span>
					</div>
					<!--列表数据-->
					<div id="Table_data">
						<div id="data-2">
							<p>
								<span>编号</span><span>用户名</span><span>设备名</span><span>维修时间</span><span>维修员</span><span>状态</span>
							</p>
						</div>
					</div>
					<!--结束-->
				</div>
			</div>
			<!--后勤维修-->
			<div id="Fix_3">
				<h2>后勤维修列表</h2>
				<i></i>
				<div id="Table_Fix_3">
					<span class="icon_left">
						<img src="${pageContext.request.contextPath }/imgs/left.png"/>
					</span>
					<span class="icon_right">
						<img src="${pageContext.request.contextPath }/imgs/right.png"/>
					</span>
					<div id="pageNum">
						<span class="SetSize" id="page_1">1</span>
					</div>
					<!--列表数据-->
					<div id="Table_data">
						<div id="data-3">
							<p>
								<span>编号</span><span>用户名</span><span>设备名</span><span>维修时间</span><span>维修员</span><span>状态</span>
							</p>
						</div>
					</div>
					<!--结束-->
				</div>
			</div>
			<!--多媒体设备报修-->
			<div id="Fix_4">
				<h2>多媒体设备报修列表</h2>
				<i></i>
				<div id="Table_Fix_4">
					<span class="icon_left">
						<img src="${pageContext.request.contextPath }/imgs/left.png"/>
					</span>
					<span class="icon_right">
						<img src="${pageContext.request.contextPath }/imgs/right.png"/>
					</span>
					<div id="pageNum">
						<span class="SetSize" id="page_1">1</span>
					</div>
					<!--列表数据-->
					<div id="Table_data">
						<div id="data-4">
							<p>
								<span>编号</span><span>用户名</span><span>设备名</span><span>维修时间</span><span>维修员</span><span>状态</span>
							</p>
						</div>
					</div>
					<!--结束-->
				</div>
			</div>
			<div id="foot">
				<p>版权归属:贵州师范学院 数学与计算机科学学院。地址:贵州省贵阳市乌当区高新路115号贵州师范学院</p>
			</div>
		</div>
	</body>
</html>