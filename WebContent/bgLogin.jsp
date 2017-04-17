<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>后台管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bgLogin.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/sha1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bgLogin.js"></script>
<script type="text/javascript">
	$(function(){
		/* 获取管理员的cookie(名字和头像图片名称)，如果设置了记住我的话 */
		/* $.post("${pageContext.request.contextPath}/manager_getUserCookie",function(data){
			if(data != ""){
				var arr = data.split(",");
				$("#uName").val(arr[1]);
				var newSrc = $("#headImage").prop("src").substring(0,$("#headImage").prop("src").lastIndexOf('/') + 1);
				$("#headImage").prop("src", newSrc + arr[0]);
			}
		},"text"); */
	});
</script>
</head>
<body>
	<div id="content">
		<div id="bglogin">
			<div id="head">
				<img src="${pageContext.request.contextPath }/imgs/1.jpg"
					title="点击切换头像" id="headImage" />
			</div>
			<div id="rg_lg">
				<div id="tip"></div>
				<!--登录-->
				<div id="login">
					<form id="loginForm"
						action="${pageContext.request.contextPath }/fix_UserLogin"
						method="post">
						<input type="text" name="fix_name" id="uName" placeholder="输入用户名" />
						<input type="password" name="fix_pass" id="uPass" placeholder="输入密码" />
						<p id="for_rg">
							<a id="forget">忘记密码？</a> <a id="rg">注册</a>
						</p>
						<span id="remeber" title="0"> <i></i>
						</span> <span id="me"> 记住我？ </span> <input type="submit" value="登录"
							id="loginBtn" />
					</form>
				</div>
				<!--注册-->
				<div id="register">
					<form
						action="${pageContext.request.contextPath }/manager_insertManager"
						method="post" id="registerForm">
						<input type="text" name="uName" id="ruName" placeholder="输入用户名" />
						<input type="password" name="uPass" id="ruPass" placeholder="输入密码" />
						<input type="password" name="ruPass" id="ruPassword"
							placeholder="确认密码" /> <span id="have"> 已有帐号？登录 </span> <input
							type="submit" value="注册" id="registerBtn" />
					</form>
				</div>
				<div id="errorTip">${errorTip }</div>
			</div>
		</div>
	</div>
</body>
</html>