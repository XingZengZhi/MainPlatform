<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.maintain.domain.equipment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/indexFix.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/indexFix.js"></script>
</head>
<body>
	<!-- 顶部信息模块 -->
	<div id="headMsg">
		<div class="headLeftMsg">
			<span id="ind"></span>
			<p>未受理维修数</p>
			<font class="leftmore">最近更新</font>
			<div id="more">
				<ul id="moreresult1">
				</ul>
			</div>
		</div>
		<div class="headMidMsg">
			<span id="num"></span>
			<p>修理成功率</p>
			<!-- <font class="midmore">更多信息</font>
			<div id="more">
				<ul>
					<li><font>机房漏水</font><strong>2016-10-10</strong></li>
					<li><font>创新创业中心断网</font><strong>2016-10-10</strong></li>
					<li><font>机房漏水</font><strong>2016-10-10</strong></li>
					<li><font>机房漏水</font><strong>2016-10-10</strong></li>
					<li><font>机房漏水</font><strong>2016-10-10</strong></li>
				</ul>
			</div> -->
		</div>
		<div class="headRightMsg">
			<span id="sl"></span>
			<p>当前受理维修数</p>
			<font class="rightmore">当前受理</font>
			<div id="more">
				<ul id="moreresult2">
				</ul>
			</div>
		</div>
	</div>
	<!-- 历史维修快速浏览模块 -->
	<div id="history">
		<i id="circle"></i>
		<p>历史维修浏览</p>
		<div id="hisMsg">
			<ul>
				<c:forEach var="list" items="${sessionScope.eqs }">
					<li>
						<i id="smallCir"></i>
						<span style="margin-left:20px;"><font style="font-weight:600;">状态:</font>以修理 </span>
						<span>时间: ${list.sleqfixTime }</span>
						<span>地点: ${list.slSpace }</span>
						<p>
							<font>详细信息:</font>
							${list.sleqfixmessage }
						</p>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>