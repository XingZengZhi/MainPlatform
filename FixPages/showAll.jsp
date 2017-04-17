<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/showAll.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>
<body>
	<c:if test="${not empty requestScope.msg }">
		<p style="margin-left:0;width:100%;color:red;text-align:center;height:20px;line-height:20px;border:none;">${requestScope.msg }</p>
	</c:if>
	<div id="tb">
		<div id="th">
			<span id="eqid">编号</span><span id="eqname">设备名</span><span id="eqtime">报修时间</span><span id="eqmsg" style="text-align:center;">维修信息</span><span id="eqcz">操作选项</span>
		</div>
		<c:forEach var="eqs" items="${requestScope.eqs }">
			<form action="${pageContext.request.contextPath }/slServlet?eqID=${eqs.eqID }" method="post">
				<div id="tr">
					<span id="eqid">${eqs.eqID }</span><span id="eqname">${eqs.eqName }</span><span id="eqtime">${eqs.fixTime }</span>
					<span id="eqmsg">${eqs.fixMessage }</span>
					<span id="eqsl"><input type="submit" value="受理" id="sl" /></span>
				</div>
			</form>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/showAll.js" charset="UTF-8"></script>
</html>
