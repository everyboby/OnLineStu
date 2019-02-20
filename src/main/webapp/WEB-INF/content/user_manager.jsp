<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>用户管理</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="lib/checkbox/build.css">
<script src="lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".knob").knob();
	});
</script>
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
<!-- goodalert -->
<link rel="stylesheet" href="lib/goodalert/css/goodalert.css">
<script type="text/javascript" src="lib/goodalert/js/goodalert.js"></script>
</head>

<body class=" theme-blue" style="overflow-x:hidden;">

	<!-- Demo page code -->

	<script type="text/javascript">
		$(function() {
			var match = document.cookie.match(new RegExp('color=([^;]+)'));
			if (match)
				var color = match[1];
			if (color) {
				$('body').removeClass(function(index, css) {
					return (css.match(/\btheme-\S+/g) || []).join(' ')
				})
				$('body').addClass('theme-' + color);
			}

			$('[data-popover="true"]').popover({
				html : true
			});

		});
	</script>
	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

	<script type="text/javascript">
		$(function() {
			var uls = $('.sidebar-nav > ul > *').clone();
			uls.addClass('visible-xs');
			$('#main-menu').append(uls.clone());
		});
	</script>

	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a class="" href="loginshow.do"><span class="navbar-brand"><img
					style="width: 28px; heigt: 28px;" src="images/logo.png">北京宝满分教育科技有限公司</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small"
						style="position: relative; top: 3px;"></span>${loginUser.userName}<i
						class="fa fa-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="logout.do">退出登录</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</div>

	<div class="sidebar-nav">
		<ul>
			<li><a href="loginshow.do" class="nav-header"><i
					class="fa fa-fw fa-dashboard"></i> 首页</a></li>
			<li><a href="#" data-target=".premium-menu"
				class="nav-header collapsed" data-toggle="collapse"><span
					class="glyphicon glyphicon-indent-left" aria-hidden="true"></span>&nbsp;&nbsp;思维导图<i
					class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="premium-menu nav nav-list collapse">
					<c:if test="${loginUser.add==1 or loginUser.userIsroot==1}">
						<li><a href="thinking_save.do"><span
								class="fa fa-caret-right"></span>新建</a></li>
					</c:if>
					<li><a href="thinkAll.do"><span class="fa fa-caret-right"></span>查看历史</a></li>
				</ul>
			</li>
			<li><a href="#" data-target=".premium-menu2"
				class="nav-header collapsed" data-toggle="collapse"><span
					class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;&nbsp;知识切片<i
					class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="premium-menu2 nav nav-list collapse">
					<c:if test="${loginUser.add==1 or loginUser.userIsroot==1}">
						<li><a href="newueditor.do"><span
								class="fa fa-caret-right"></span>新建题目</a></li>
					</c:if>
					<li><a href="questinfo.do"><span class="fa fa-caret-right"></span>查看及修改</a></li>
				</ul>
			</li>
			<li><a href="upl_point_vi.do" class="nav-header"><span
					class="glyphicon glyphicon-film" aria-hidden="true"></span>&nbsp;考点视频</a></li>
			<li><a href="preSelect.do" class="nav-header"><i
					class="fa fa-fw fa-dashboard"></i>&nbsp;检索管理</a></li>
			<c:if test="${loginUser.userIsroot==1}">
				<li><a href="user_manager.do" class="nav-header"><span
						class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;用户管理</a></li>
			</c:if>
		</ul>
	</div>


	<div class="content" style="min-height:700px">
		<div class="header">
			<h1 class="page-title">北京宝满分教育科技有限公司</h1>
			<ul class="breadcrumb">
				<li><a href="loginshow.do">Home</a></li>
				<li class="active">用户管理</li>
			</ul>

		</div>
		<div class="main-content">
			<h1 class="page">用户列表</h1>
			<div class="col-lg-2 col-lg-offset-10">
				<a href="#addUser" data-toggle="modal" class="padding-right-small"><button
						class="btn">添加</button></a>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<table class="table">
						<thead>
							<tr>
								<th>序号</th>
								<th>用户名</th>
								<th>email</th>
								<th>root</th>
								<th>增加</th>
								<th>删除</th>
								<th>修改</th>
							</tr>
						</thead>
						<tbody>
							<c:if
								test="${allUsers.list==null || fn:length(allUsers.list) == 0}">
								<tr>
									<td colspan="6">用户列表为空！</td>
								</tr>
							</c:if>
							<c:forEach items="${allUsers.list}" varStatus="i" var="item">
								<tr>
									<td>${(allUsers.pageNum-1)*3+i.index}</td>
									<td>${item.userName}<br> <span class="text-sm">
											<a href="#editUser" data-toggle="modal"
											class="padding-right-small" data-userId="${item.userId}"
											data-userName="${item.userName}"
											data-userpwd="${item.userPwd}"
											data-userEmail="${item.userEmail}"
											data-userIsroot="${item.userIsroot}" data-add="${item.add}"
											data-del="${item.del}" data-upd="${item.upd}"><i
												class="fa fa-pencil "></i> 编辑</a> <a href="#myModal"
											data-toggle="modal" data-delusername="${item.userName}"
											data-delid="${item.userId}"><i class="fa fa-trash-o "></i>
												删除</a>
									</span></td>
									<td>${item.userEmail}</td>
									<td>
										<div class="checkbox checkbox-info">
											<c:if test="${item.userIsroot=='1'}">
												<input id="check1" +${item.userId} class="styled"
													type="checkbox" checked disabled>
											</c:if>
											<c:if test="${item.userIsroot=='0'}">
												<input id="check1" +${item.userId} class="styled"
													type="checkbox" disabled>
											</c:if>
											<label for="check1" +${item.userId}> 超级管理员 </label>
										</div>
									</td>
									<td>
										<div class="checkbox checkbox-danger">
											<c:if test="${item.add==1}">
												<input id="check2" +${item.userId} class="styled"
													type="checkbox" checked disabled>
											</c:if>
											<c:if test="${item.add==0}">
												<input id="check2" +${item.userId} class="styled"
													type="checkbox" disabled>
											</c:if>
											<label for="check2" +${item.userId}> 可增加 </label>
										</div>
									</td>
									<td>
										<div class="checkbox checkbox-success">
											<c:if test="${item.del==1}">
												<input id="check3" +${item.userId} class="styled"
													type="checkbox" checked disabled>
											</c:if>
											<c:if test="${item.del==0}">
												<input id="check3" +${item.userId} class="styled"
													type="checkbox" disabled>
											</c:if>
											<label for="check3" +${item.userId}> 可删除 </label>
										</div>
									</td>
									<td>
										<div class="checkbox checkbox-primary">
											<c:if test="${item.upd==1}">
												<input id="check4" +${item.userId} class="styled"
													type="checkbox" checked disabled>
											</c:if>
											<c:if test="${item.upd==0}">
												<input id="check4" +${item.userId} class="styled"
													type="checkbox" disabled>
											</c:if>
											<label for="check4" +${item.userId}> 可修改 </label>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-lg-8 col-lg-offset-2">
						<div>
							<ul class="pagination" id="test">
								<p>当前 ${allUsers.pageNum }页,总${allUsers.pages } 页,总
									${allUsers.total } 条记录</p>
								<li><a
									href="${pageContext.request.contextPath}/user_manager.do?pageNo=${allUsers.firstPage}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:if test="${allUsers.hasPreviousPage }">
									<li><a
										href="${pageContext.request.contextPath}/user_manager.do?pageNo=${allUsers.pageNum-1}"
										aria-label="Previous"><span aria-hidden="true">&lt;</span></a></li>
								</c:if>
								<c:if test="${allUsers.pages>0}">
									<c:forEach varStatus="i" begin="1" end="${allUsers.pages}">
										<c:choose>
											<c:when test="${allUsers.pageNum==i.index}">
												<li class="active"><a
													href="${pageContext.request.contextPath}/user_manager.do?pageNo=${i.index}">${i.index}</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${pageContext.request.contextPath}/user_manager.do?pageNo=${i.index}">${i.index}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${allUsers.hasNextPage}">
									<li><a
										href="${pageContext.request.contextPath}/user_manager.do?pageNo=${allUsers.pageNum+1}"
										aria-label="Previous"><span aria-hidden="true">&gt;</span></a></li>
								</c:if>
								<li><a
									href="${pageContext.request.contextPath}/user_manager.do?pageNo=${allUsers.lastPage}"
									aria-label="Next">&raquo;</span>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="modal small fade" id="myModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">X</button>
									<h3 id="myModalLabel">确认删除</h3>
								</div>
								<div class="modal-body">
									<p class="error-text">
										<i class="fa fa-warning modal-icon"></i>确认删除该用户(<span
											id="deluser"></span>)？<br>这将不可撤销
									</p>
									<input type="hidden" id="delId">
								</div>
								<div class="modal-footer">
									<button class="btn btn-default" data-dismiss="modal"
										aria-hidden="true">取消</button>
									<button class="btn btn-danger" data-dismiss="modal"
										onclick="delUSer()">删除</button>
								</div>
							</div>
						</div>
					</div>
					<script type="application/javascript">
						
						
							$('#myModal').on('show.bs.modal', function(e) {
								// 执行一些动作...data-id
								var delusername = $(e.relatedTarget).data("delusername");
								var delId = $(e.relatedTarget).data("delid");
								$('#deluser').html(delusername);
								$('#delId').val(delId);
								console.log(delusername+delId);
							})
							function delUSer(){
								var delid=$('#delId').val();
								window.location.href="delUser.do?delid="+delid;
							}
					
					</script>
					<div class="modal fade" id="editUser" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">X</button>
									<h3 id="myModalLabel">修改用户</h3>
								</div>
								<div class="modal-body">
									<form action="editUser.do" method="post">
										<div class="form-group">
											<input type="hidden" name="userId" id="userId"> <label>用户名</label>
											<input type="text" class="form-control" id="userName"
												name="userName" value="Ashley Jacobs">
										</div>
										<div class="form-group">
											<label>密码</label> <input type="text" class="form-control"
												id="userPwd" name="userPwd" value="ash11297">
										</div>

										<div class="form-group">
											<label>Email</label> <input type="text" class="form-control"
												name="userEmail" id="userEmail" value="ash11297@example.com">
										</div>
										<div class="form-group">
											<label>Super管理员</label>
											<div class="checkbox checkbox-info">
												<input id="updroot" class="styled" type="checkbox"
													name="addroot"> <label for="updroot">Super</label>
											</div>
										</div>
										<div class="form-group">
											<label>操作权限</label>
											<div class="checkbox checkbox-danger">
												<input id="updctrl1" class="styled" type="checkbox"
													name="addpower" value="1"> <label for="updctrl1">可增加</label>
											</div>
											<div class="checkbox checkbox-success">
												<input id="updctrl2" class="styled" type="checkbox"
													name="addpower" value="2"> <label for="updctrl2">可删除</label>
											</div>
											<div class="checkbox checkbox-primary">
												<input id="updctrl3" class="styled" type="checkbox"
													name="addpower" value="4"> <label for="updctrl3">可修改</label>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn btn-default" data-dismiss="modal"
												aria-hidden="true">取消</button>
											<input type="submit" class="btn btn-primary">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<script type="application/javascript">
						
						
							$('#editUser').on('show.bs.modal', function(e) {
								// 执行一些动作...data-id
								var userId = $(e.relatedTarget).data("userid");
								var userName = $(e.relatedTarget).data("username");
								var userEmail = $(e.relatedTarget).data("useremail");
								var userIsroot = $(e.relatedTarget).data("userisroot");
								var userpwd = $(e.relatedTarget).data("userpwd");
								var add = $(e.relatedTarget).data("add");
								var del = $(e.relatedTarget).data("del");
								var upd = $(e.relatedTarget).data("upd");
								$('#userId').val(userId);
								$('#userName').val(userName);
								$('#userPwd').val(userpwd);
								$('#userEmail').val(userEmail);
								if(userIsroot){
									$("#updroot").prop("checked",true);
								}else{
									$("#updroot").prop("checked",false);
								}
								if(add){
									$("#updctrl1").prop("checked",true);
								}else{
									$("#updctrl1").prop("checked",false);
								}
								if(del){
									$("#updctrl2").prop("checked",true);
								}else{
									$("#updctrl2").prop("checked",false);
								}
								if(upd){
									$("#updctrl3").prop("checked",true);
								}else{
									$("#updctrl3").prop("checked",false);
								}
							})
						
					
					</script>
					<div class="modal fade" id="addUser" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">X</button>
									<h3 id="myModalLabel">添加用户</h3>
								</div>
								<div class="modal-body">
									<form action="addUser.do" method="post">
										<div class="form-group">
											<label>用户名</label> <input type="text" class="form-control"
												name="userName" value="">
										</div>
										<div class="form-group">
											<label>密码</label> <input type="text" class="form-control"
												name="userPwd" value="">
										</div>

										<div class="form-group">
											<label>Email</label> <input type="text" class="form-control"
												name="userEmail" value="">
										</div>
										<div class="form-group">
											<label>Super管理员</label>
											<div class="checkbox checkbox-info">
												<input id="addroot" class="styled" type="checkbox"
													name="addroot"> <label for="addroot">Super</label>
											</div>
										</div>
										<div class="form-group">
											<label>操作权限</label>
											<div class="checkbox checkbox-danger">
												<input id="addctrl1" class="styled" type="checkbox"
													name="addpower" value="1"> <label for="addctrl1">可增加</label>
											</div>
											<div class="checkbox checkbox-success">
												<input id="addctrl2" class="styled" type="checkbox"
													name="addpower" value="2"> <label for="addctrl2">可删除</label>
											</div>
											<div class="checkbox checkbox-primary">
												<input id="addctrl3" class="styled" type="checkbox"
													name="addpower" value="4"> <label for="addctrl3">可修改</label>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn btn-default" data-dismiss="modal"
												aria-hidden="true">取消</button>
											<input type="submit" class="btn btn-primary">
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
	<hr>
	<p align="center">
		©Copyright <a href="#" target="_blank">北京宝满分教育科技有限公司</a>
	</p>
	</footer>
	<div class="alert"></div>
	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
			var msg = "${msg}";
			if (msg != null && msg != "") {
				if (msg == "2") {
					warning_prompt("您没有删除权限！", 1200);
				} else {
					info_prompt(msg, 1200);
				}
			}
		});
	</script>

</body>

</html>
