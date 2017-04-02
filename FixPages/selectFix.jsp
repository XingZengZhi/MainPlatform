<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/selectCss.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/search.js"></script>
</head>
<body>
	<div id="searchContent">
		<div id="head_search">
			<form action="${pageContext.request.contextPath }/search" method="post">
				<input type="text" name="searchName" id="selText" />
				<button type="submit" id="selBtn">搜索</button>
			</form>
		</div>
		<div id="show_contents">
			<%
				ArrayList<String> lists = (ArrayList<String>)request.getAttribute("lists");
				if(lists!=null){
					for(String str:lists){
				
			%>
						<p><span><%=str %></span><a>详情</a></p>
			<%
					}
				}else{
			%>
					<span>没有查询到内容</span>
			<%
				}
			%>
		</div>
		<!--显示详情的信息 -->
		<div id="show_message">
			<p>
				<span style="font-weight:600;">提交人: </span><span id="name"></span>
				<span style="font-weight:600;margin-left:20px;">提交时间: </span><span id="time"></span>
			</p>
			<p>
				<span style="font-weight:600;">地点: </span><span id="space"></span>
			</p>
			<p id="ms">
				<span style="font-weight:600;">描述: </span><span id="msg" style="font-size:14px;line-height:22px;"></span>
			</p>
			<button id="btn">确定</button>
		</div>
	</div>
</body>
</html>