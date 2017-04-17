<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/login.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
<script src="${pageContext.request.contextPath }/js/jquery.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/login.js"
	type="text/javascript" charset="utf-8"></script>
<title>网上报修平台登录</title>
</head>
<body>
	<div id="bgImg"></div>
	<form action="/MainPlatform/LoginServlet" method="post">
		<div id="loginBox">
			<h2>网上报修平台登录</h2>
			<div id="User">
				<ul>
					<li><span>用户名</span><input type="text" name="username"
						placeholder="请输入用户名" /></li>
					<li><span>密码</span><input type="password" name="password"
						placeholder="请输入密码" /></li>
					<li><span>权限</span><input readonly="readonly" type="text"
						name="permissions" placeholder="点击选择" /></li>
					<li><input type="submit" value="登录" /></li>
				</ul>
			</div>
			<div id="permissions">
				<p>维修员</p>
			</div>
			<p id="noUser">没有账户？<a href="${pageContext.request.contextPath }/UserPage/RegisterPage.jsp">注册</a></p>
			<p id="errorMsg">${requestScope.errorMsg }</p>
		</div>
	</form>
</body>
</html>