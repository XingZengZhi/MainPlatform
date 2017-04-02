<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<title>网上报修平台主页</title>
</head>
<body>
	<!-- 蒙板-->
	<div id="mb"></div>
	<!-- 主页登录的小弹窗 -->
	<div id="loginBox">
		<h2>用户登录</h2>
		<span id="del">×</span>
		<form action="${pageContext.request.contextPath }/UserPageIndexLogin" method="post">
			<ul>
				<li><font>用户名：</font><input type="text" name="tName" placeholder="请输入用户名" /></li>
				<li><span id="message" color="red"></span></li>
				<li><font>密码：</font><input type="password" name="tPassword" placeholder="请输入密码" /></li>
				<li><input type="submit" value="登录" /></li>
			</ul>
		</form>
	</div>
	
	<div id="content">
		<div id="headContent">
			<img src="${pageContext.request.contextPath }/imgs/top.png" />
		</div>
		<div id="midContent">
			<div id="midLeftContent">
				<div id="UserLogin">
					<c:if test="${ not empty teacher.imgPath }">
						<img src="${sessionScope.teacher.imgPath  }" title="我的头像"/>
					</c:if>
					<c:if test="${ empty teacher.imgPath  }">
						<img src="${pageContext.request.contextPath }/imgs/initHead.jpg" title="我的头像"/>
					</c:if>
					<p>
						<c:if test="${ empty teacher.tName }">
							<span id="loginName" style="display:none;"></span>
							<a href="javascript:;" id="login">登录</a>
							<a href="${pageContext.request.contextPath }/UserPage/RegisterPage.jsp" id="login">注册</a>
						</c:if>
						<c:if test="${ not empty teacher.tName }">
							昵称：<span id="loginName">${teacher.tName }</span><br>
							<a href="/MainPlatform/UserPageIndexLogin?action=des" id="des">注销</a>
						</c:if>
					</p>
					<a href="javascript:;" name="person">修改个人资料</a>
					<a href="javascript:;" name="history">查看历史报修记录</a>
				</div>
				<ul>
					<li><a href="javascript:;" name="addFix"><span class="leftF">&gt;</span>添加维修项目<span class="rightF">&lt;</span></a></li>
					<li><a href="javascript:;" name="fixSta"><span class="leftF">&gt;</span>项目维修进度<span class="rightF">&lt;</span></a></li>
				</ul>
			</div>
			<!-- 项目添加盒子 -->
			<div id="midRightContent">
				<div id="addDiv">
					<h2>添加维修项目</h2>
					<form action="/MainPlatform/addServlet" method="post">
						<ul>
							<li><font>用户：</font><input type="text" name="tName" value="${teacher.tName }" /></li>
							<li><font>设备名：</font><input type="text" name="eqName" placeholder="填写设备名" /></li>
							<li><font>地点：</font><input type="text" name="eqSpace" placeholder="填写地点" /></li>
							<li><font>报修时间：</font><input type="text" name="fixTime" placeholder="点击获取当前时间" /></li>
							<li>
								<font class="wxmsg">详细信息：</font>
								<textarea rows="8" cols="40" name="fixMessage" placeholder="填写相关信息,字数不超过两百"></textarea>
							</li>
							<li><input type="submit" value="提交" id="addSubmit" /></li>
						</ul>
					</form>
					<p style="margin-left:300px;margin-top:20px;color:red;" id="mess"></p>
				</div>
				<!-- 个人信息盒子 -->
				<div id="personMsg">
					<h2>个人资料修改</h2>
					<!-- 上传头像 -->
					<form id="upload" action="${pageContext.request.contextPath }/UploadServlet?username=${teacher.tName}" method="post" enctype="multipart/form-data">
						<img alt="显示错误" src="${pageContext.request.contextPath }/imgs/green.jpg" title="我的头像" />
						<input type="file" name="filename" />
						<input type="submit" value="上传" />
					</form>
					<!-- 个人基本信息 -->
					<form action="${pageContext.request.contextPath }/updatePerson" method="POST">
						<ul>
							<li><input type="hidden" name="tId" value="${teacher.tId }" /></li>
							<li><font>用户名:</font><input type="text" name="tName" value="${teacher.tName }" readonly="readonly" /><span id="chName">修改</span></li>
							<li><font>电话号码:</font><input type="text" name="telPhone" value="${teacher.telPhone }" readonly="readonly" /><span id="chTel">修改</span></li>
							<li><input type="submit" value="确认修改" id="ch" /></li>
						</ul>
					</form>
				</div>
				<!-- 维修进度 -->
				<div id="fixSta">
					<h2>维修进度</h2>
					<div id="fixContent">
						<p id="head"><span>编号</span><span>项目名</span><span>报修时间</span><span>报修状态</span></p>
					</div>
					<div id="paging">
						<a id="pre">&lt;</a>
						<div id="lab">
							<div id="Labels">
								<span>1</span>
							</div>
						</div>
						<a id="nex">&gt;</a>
					</div>
				</div>
				
			</div>
		
		</div>
		<div id="footerContent">
			<p>贵州师范学院 &copy;数学与计算机科学学院</p>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/UserPageIndex.js"></script>
</html>