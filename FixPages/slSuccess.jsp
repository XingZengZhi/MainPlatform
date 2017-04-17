<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.maintain.domain.equipment"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/slSuccess.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/slSuccess.js"></script>
<title></title>
</head>
<body>
	<div id="title">
		<h2>待受理设备</h2>
	</div>
	<div id="th">
		<span id="eqID">设备编号</span><span id="eqName">设备名称</span><span id="eqTime">受理时间</span><span id="eqCz">受理操作</span>
	</div>
	<div id="slSuccessBox">
		<c:forEach items="${sleqs }" var="e">
		<div id="th">
			<span id="eqID">${e.sleqID }</span><span id="eqName">${e.sleqName }</span><span id="eqTime">${e.sleqfixTime }</span><span id="eqCz"><a id="success" name="${e.sta }">维修中...</a><a id="del">成功</a></span>
		</div>
		</c:forEach>
	</div>
	<div id="page">
		<span id="leftBtn">&lt;</span>
		<div id="as">
		</div>
		<span id="rightBtn">&gt;</span>
		<font><b>共:</b><b id="allpage"></b>页</font>
		<input type="text" id="txt" />
		<input type="button" id="btn" value="GO"/>
	</div>
</body>
</html>