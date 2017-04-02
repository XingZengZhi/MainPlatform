<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/register.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/register.js"></script>
<title>注册</title>
</head>
<body>
	<form action="/MainPlatform/RegisterServlet" method="post">
		<div id="registerBox">
			<div id="changeRe">
				<span id="yg">维修员注册</span><span></span><span></span>
			</div>
			<!-- 教师注册 -->
			<ul>
				<li><font>姓名&nbsp;</font><input type="text" name="username" placeholder="请填写真实姓名" /></li>
				<li><span style="color:red;font-weight:600;" id="unMsg">&nbsp;</span></li>
				<li><font>密码&nbsp;</font><input type="password" name="password" placeholder="请填写密码" /></li>
				<li><span style="color:red;font-weight:600;" id="pwMsg">&nbsp;</span></li>
				<li><font>确认密码&nbsp;</font><input type="password" name="repassword" placeholder="确认密码" /></li>
				<li><span style="color:red;font-weight:600;" id="repMsg">&nbsp;</span></li>
				<li><font>手机号&nbsp;</font><input type="text" name="tel" placeholder="请填写手机号" /></li>
				<li><span style="color:red;font-weight:600;" id="telMsg">&nbsp;</span></li>
				<li><input type="submit" value="注册" name="submit1" /><a href="${pageContext.request.contextPath }/UserPage/index.jsp" id="ind">报修首页</a></li>
				<li><p>${requestScope.msg }</p></li>
			</ul>
			
			<!-- 维修员注册 -->
			<ul>
				<li><font>姓名&nbsp;</font><input type="text" name="ygusername" placeholder="请填写真实姓名" /></li>
				<li><span style="color:red;font-weight:600;" id="ygunMsg">&nbsp;</span></li>
				<li><font>密码&nbsp;</font><input type="password" name="ygpassword" placeholder="请填写密码" /></li>
				<li><span style="color:red;font-weight:600;" id="pwMsg">&nbsp;</span></li>
				<li><font>确认密码&nbsp;</font><input type="password" name="reygpassword" placeholder="确认密码" /></li>
				<li><span style="color:red;font-weight:600;" id="repMsg">&nbsp;</span></li>
				<li><font>手机号&nbsp;</font><input type="text" name="ygtel" placeholder="请填写手机号" /></li>
				<li><span style="color:red;font-weight:600;" id="telMsg">&nbsp;</span></li>
				<li><input type="submit" value="注册" name="submit2" /><a href="${pageContext.request.contextPath }/Pages/index.jsp" id="ind">维修首页</a></li>
				<li><p>${requestScope.msg }</p></li>
			</ul>
			
		</div>
	</form>
</body>
</html>