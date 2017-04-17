<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>后台管理系统</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/imgs/fixicon.ico" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/fix.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/sha1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/fix.js"></script>
		<script type="text/javascript">
			$(function(){
				SendAjaxByPage(1);
				//根据页数发送ajax
				function SendAjaxByPage(page) {
					//异步获取用户总数
					var count = 0;
					$.ajax({
						type : "POST",
						dataType : "text",
						url : "${pageContext.request.contextPath}/user_UserCount",
						success : function(data) {
							$("#max").text(data);
							var count = parseInt(data)
							if (page == 1) {
								if (count > 6) {
									$("#rightPage").fadeIn();
								}
							}
						}
					});
					//清空分页再发ajax
					$("#item").remove();
					$.post("${pageContext.request.contextPath}/user_Page", {
						"pageIndex" : page,
						"pageSize" : 6
					}, function(data) {
						GetJsonForData(data);
					}, "json");
				}
				
				//分页按钮
				var $pageleft = $("#leftPage");
				var $pageright = $("#rightPage");
				var pageSize = 8;//每页的条数
				$pageright.click(function() {
					var min = parseInt($("#min").text());
					var max = Math.ceil(parseInt($("#max").text()) / pageSize);
					min++;
					if(min > max){
						return;
					}
					if (min > 1 && min <= max) {
						$pageleft.fadeIn(0);
						$pageright.fadeIn(0);
					}
					if (min > max) {
						min = max;
					}
					/*等于最大分页数时，向右标志消失*/
					if (min == max) {
						min = max;
						$pageright.fadeOut(0);
						$("#min").text(min);
					}
					SendAjaxByPage(min);
				});
				$pageleft.click(function() {
					var min = parseInt($("#min").text());
					var max = parseInt($("#max").text());
					min--;
					if(min < 0){
						return;
					}
					if(min < max && min != 1){
						$pageright.fadeIn(0);
						$pageleft.fadeIn(0);
					}else{
						$pageright.fadeIn(0);
					}
					
					if(min == 1){
						min = 1;
					}
					$("#min").text(min);
					SendAjaxByPage(min);
				});
				
				//根据ajax返回对象提取用户信息
				function GetJsonForData(data) {
					for (var i = 0; i < data.length; i++) {
						$("<p id='item'>" + "<span id='uid'>"
										+ data[i].uid + "</span>" + "<span>"
										+ data[i].uname + "</span>" + "<span>"
										+ data[i].upassword + "</span>" + "<span>"
										+ data[i].utelphone + "</span>" + "<span>"
										+ data[i].uimgpath + "</span>" + 
										"</p>").insertBefore(
								"#pageList");
					}
				}
				
			});
		</script>
	</head>

	<body>
		<div id="left_link">
			<img src="${pageContext.request.contextPath }/imgs/top.png" id="logo" />
			<img src="${pageContext.request.contextPath }/imgs/1.jpg" id="head" />
			<p id="user">${fixer.fix_name }</p>
			<p id="role">身份：管理员</p>
			<ul>
				<li class="active" value="1"><span>用户管理</span></li>
				<li value="2"><span>维修员管理</span></li>
				<li value="3"><span>设备管理</span></li>
			</ul>
		</div>
		<div id="content">
			<!--顶部菜单栏-->
			<div id="link_1">
				<div id="content_top">
					<div id="selecting"></div>
					<div id="search_div">
						<input type="text" name="" id="search" placeholder="搜索" />
						<button></button>
					</div>
					<div id="person">
						<img src="${pageContext.request.contextPath }/imgs/1.jpg" />
						<span id="person_name">
							${fixer.fix_name }
						</span>
						<span id="person_select">
						</span>
					</div>
				</div>
				<!--搜索匹配项-->
				<div id="selecting_item">
					<i></i>
					<p>用户搜索</p>
					<p>维修员搜索</p>
					<p>设备搜索</p>
				</div>
				<div id="person_setting">
					<i></i>
					<a href="${pageContext.request.contextPath }/fix_LoginOut">退出</a>
				</div>
				<div id="user_table">
					<p><span>编号</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>头像路径</span></p>
					<p id="item"><span>1</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>头像路径</span></p>
					<p id="pageList" style="margin:20px 0;">
						<span id="min">1</span>
						<span id="max"></span>
						<i id="leftPage" style="width:50px;">&lt;</i>
						<i id="rightPage" style="width:50px;">&gt;</i>
					</p>
				</div>
				<button id="delete_user" title="删除用户">-</button>
				<div id="handle">
					<form action="" method="post">
						<span>要删除的用户名：</span>
						<input type="text" name="" id="" />
						<input type="submit" value="删除" />
					</form>
				</div>
			</div>
			
			<!--维修员管理-->
			<div id="link_2">
				<div id="fix_table">
					<p><span>编号</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>1</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>2</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>3</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>4</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>5</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>6</span><span>用户名</span><span>用户密码</span><span>电话号码</span></p>
				</div>
				<div id="search_fix">
					<input type="text" name="" id="" value="" />
					<button>查找</button>
					<p><span>用户名：</span><span></span></p>
					<p><span>电话号码：</span><span></span></p>
				</div>
			</div>
		
			<!--设备管理-->
			<div id="link_3">
				<div id="eq_table">
					<p><span>编号</span><span>设备名</span><span>报修时间</span><span>报修地点</span><span>报修用户</span><span>维修人员</span></p>
					<p><span>1</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>2</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>3</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>4</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>5</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>用户密码</span><span>电话号码</span></p>
					<p><span>6</span><span>用户名</span><span>用户密码</span><span>电话号码</span><span>用户密码</span><span>电话号码</span></p>
				</div>
				<div id="eq_handle">
					<input type="text" name="" id="" placeholder="输入设备名" />
					<button id="search_eq">查找设备</button>
					<p>
						<span>报修时间:</span><span></span><span>报修地点:</span><span></span>
						<span>报修用户:</span><span></span><span>维修人员:</span><span></span>
					</p>
				</div>
			</div>
		</div>
	</body>

</html>