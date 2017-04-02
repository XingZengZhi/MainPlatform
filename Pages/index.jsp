<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/FixCom.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/FixCom.js" type="text/javascript" charset="utf-8"></script>
<title>网上报修平台管理系统</title>
</head>
<body>
	<c:if test="${ empty sessionScope.fixname }">
		<c:redirect url="/UserPage/Login.jsp"></c:redirect>
	</c:if>
	<div id="content">
		<!-- 头部开始 -->
		<div id="head">
			<p id="logo">网上报修平台</p>
			<div id="time">
				<p>
					<span id="time1"></span>&nbsp;<span id="time2"></span>
				</p>
			</div>
			<p id="user"><span>欢迎您，</span>${sessionScope.fixname }</p>
			<ul id="userSet">
				<li>
					<a href="/MainPlatform/UserPageIndexLogin?action=des2">注销账户</a>
				</li>
				<li>注销账户</li>
			</ul>
		</div>
		<!-- 头部结束 -->
		<div id="midCon">
			<!-- 左侧超链接 -->
			<div id="nav">
				<ul>
					<li><a name="ind" style="background:rgba(102,102,102,0.7);" href="${pageContext.request.contextPath }/FixPages/indexFix.jsp" target="fixiframe">首页</a></li>
					<li><a href="/MainPlatform/showAllServlet" target="fixiframe">待受理设备</a></li>
					<li><a href="/MainPlatform/slSuccessServlet" target="fixiframe">以受理设备</a></li>
					<li><a href="${pageContext.request.contextPath }/FixPages/deleteFix.jsp" target="fixiframe">删除维修设备</a></li>
					<li><a href="${pageContext.request.contextPath }/FixPages/selectFix.jsp" target="fixiframe">查询已修设备</a></li>
				</ul>
			</div>
			<div id="showMsg">
				<iframe src="${pageContext.request.contextPath }/FixPages/indexFix.jsp"
					name="fixiframe" frameborder="0" scrolling="no" width="100%"
					height="99%"></iframe>
			</div>
		</div>
		<!-- 页脚 -->
		<div id="footer">
			<p>贵州师范学院 &copy;数学与计算机科学学院</p>
		</div>
	</div>
</body>
</html>