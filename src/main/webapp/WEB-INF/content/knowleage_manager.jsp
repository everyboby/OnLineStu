<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>知识管理</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

<script src="lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".knob").knob();
	});
</script>
<link rel="stylesheet" href="page/myPagination.css">
<script src="page/myPagination.js"></script>

<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">

<!-- goodalert -->
<link rel="stylesheet" href="lib/goodalert/css/goodalert.css">
<script type="text/javascript" src="lib/goodalert/js/goodalert.js"></script>
<style type="text/css">
.clear {
	clear: both
}

.RadioStyle input {
	display: none
}

.RadioStyle label {
	border: 1px solid #CCC;
	color: #666;
	padding: 2px 10px 2px 5px;
	line-height: 18px;
	min-width: 50px;
	text-align: center;
	float: left;
	margin: 2px;
	border-radius: 4px
}

.RadioStyle input:checked+label {
	background: url(images/ico_checkon.svg) no-repeat right bottom;
	border: 1px solid #00a4ff;
	background-size: 21px 21px;
	color: #00a4ff
}

.RadioStyle input:disabled+label {
	opacity: 0.7;
}
</style>
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
			<a class="" href="loginshow.do"><span class="navbar-brand"><img style="width:28px;heigt:28px;" src="images/logo.png">北京宝满分教育科技有限公司</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small"
						style="position: relative; top: 3px;">${loginUser.userName}</span>
						<i class="fa fa-caret-down"></i>
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


	<div class="content">
		<div class="header">

			<h1 class="page-title">检索管理</h1>
			<ul class="breadcrumb">
				<li><a href="loginshow.do">Home</a></li>
				<li class="active">检索管理</li>
			</ul>

		</div>
		<div class="main-content">
			<div class="panel panel-default col-lg-12">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#data" data-toggle="tab">时间</a></li>
					<li><a href="#home" data-toggle="tab">卷标</a></li>
					<li><a href="#subject" data-toggle="tab">科目</a></li>
					<li><a href="#class" data-toggle="tab">学龄段</a></li>
					<li><a href="#point" data-toggle="tab">考点</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="data">
						<div class="panel-group" id="accordion2">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#fromdate1"><span
											class="glyphicon glyphicon-search" aria-hidden="true"></span>
											查看所有出处时间 </a>
									</h4>
								</div>
								<div id="fromdate1" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="date" value="" disabled /> <label
													for="date">全部</label>
												<c:forEach items="${selectAllTime}" varStatus="i" var="item">
													<input type="checkbox" id="date" +${i.index}
														value="${item.fromTime}" disabled />
													<label for="date2">${item.fromTime}</label>
												</c:forEach>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<c:if test="${loginUser.add==1}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" href="#fromdate2"><span
												class="glyphicon glyphicon-plus" aria-hidden="true"></span>
												添加出处时间 </a>
										</h4>
									</div>
									<div id="fromdate2" class="panel-collapse collapse">
										<div class="panel-body">
											<label for="indata">输入出处时间：</label><input
												placeholder="请输入出处时间：" name="indata" id="indata" /> <input
												type="button" value="确认" onclick="addDate()" />
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${loginUser.del==1}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" href="#fromdate3"><span
												class="glyphicon glyphicon-minus" aria-hidden="true"></span>
												删除出处时间：</a>
										</h4>
									</div>
									<div id="fromdate3" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="RadioStyle">
												<div class="Block PaddingL">
													<input type="checkbox" id="deldate" value="" name="deldate"
														disabled /> <label for="deldate">全部</label>
													<c:forEach items="${selectAllTime}" varStatus="i"
														var="item">
														<input type="checkbox" id="deldate${i.index}"
															value="${item.fromId}" name="deldate" />
														<label for="deldate${i.index}">${item.fromTime}</label>
													</c:forEach>
												</div>
											</div>
											<p>
												<input type="button" style="float: right;" value="确认删除"
													onclick="delDate()" />
											</p>
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>

					<div class="tab-pane fade" id="home">
						<div class="panel-group">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#collapseOne"> <span
											class="glyphicon glyphicon-search" aria-hidden="true"></span>
											查看所有卷标
										</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="sign" value="" disabled /> <label
													for="sign">全部</label>
												<c:forEach items="${selectAllSign}" varStatus="i" var="item">
													<input type="checkbox" id="sign${i.index }"
														value="${item.signName}" disabled />
													<label for="sign${i.index }">${item.signName}</label>
												</c:forEach>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<c:if test="${loginUser.add==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#collapseTwo"><span
											class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											添加卷标 </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<label for="juanbiao">输入卷标名：</label><input
											placeholder="请输入卷标名：" name="juanbiao" id="juanbiao" /> <input
											type="button" value="确认" onclick="insign()" />
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${loginUser.del==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#collapseThree"><span
											class="glyphicon glyphicon-minus" aria-hidden="true"></span>
											删除卷标： </a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="delsign" value="" name="delsign"
													disabled /> <label for="delsign">全部</label>
												<c:forEach items="${selectAllSign}" varStatus="i" var="item">
													<input type="checkbox" id="delsign${i.index }"
														value="${ item.signId}" name="delsign" />
													<label for="delsign${i.index }">${item.signName}</label>
												</c:forEach>
											</div>
										</div>
										<p>
											<input type="button" style="float: right;" value="确认删除"
												onclick="delsign()" />
										</p>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							</c:if>
						</div>
					</div>


					<div class="tab-pane fade" id="subject">
						<div class="panel-group" id="accordion2">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#subject1"><span
											class="glyphicon glyphicon-search" aria-hidden="true"></span>
											查看所有科目 </a>
									</h4>
								</div>
								<div id="subject1" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="selsubject" value="" disabled />
												<label for="selsubject">全部</label>
												<c:forEach items="${selectAllSubject}" varStatus="i"
													var="item">
													<input type="checkbox" id="selsubject${i.index }"
														value="${item.subjectId}" disabled />
													<label for="selsubject${i.index }">${item.subjectName }</label>
												</c:forEach>
											</div>
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${loginUser.add==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#subject2"><span
											class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											添加科目 </a>
									</h4>
								</div>
								<div id="subject2" class="panel-collapse collapse">
									<div class="panel-body">
										<label for="insubject">输入科目名：</label><input
											placeholder="请输入科目名：" name="insubject" id="insubject" /> <input
											type="button" value="确认" onclick="insubject()" />
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${loginUser.del==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#subject3"> <span
											class="glyphicon glyphicon-minus" aria-hidden="true"></span>
											删除科目：
										</a>
									</h4>
								</div>
								<div id="subject3" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="delsubject" value=""
													name="delsubject" disabled /> <label for="delsubject">全部</label>
												<c:forEach items="${selectAllSubject}" varStatus="i"
													var="item">
													<input type="checkbox" id="delsubject${i.index }"
														value="${item.subjectId}" name="delsubject" />
													<label for="delsubject${i.index }">${item.subjectName }</label>
												</c:forEach>
											</div>
										</div>
										<p>
											<input type="button" style="float: right;" value="确认删除"
												onclick="delsubject()" />
										</p>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							</c:if>
						</div>
					</div>

					<div class="tab-pane fade" id="class">
						<div class="panel-group" id="accordion2">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#class1"> <span
											class="glyphicon glyphicon-search" aria-hidden="true"></span>
											查看所有学龄段
										</a>
									</h4>
								</div>
								<div id="class1" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="selclass" value="" disabled /> <label
													for="selclass">全部</label>
												<c:forEach items="${selectAllClass}" varStatus="i"
													var="item">
													<input type="checkbox" id="selclass${i.index }"
														value="${item.classId }" disabled />
													<label for="selclass${i.index }">${item.className }</label>
												</c:forEach>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<c:if test="${loginUser.add==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#class2"><span
											class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											添加学龄段 </a>
									</h4>
								</div>
								<div id="class2" class="panel-collapse collapse">
									<div class="panel-body">
										<label for="inclass">输入学龄段：</label><input
											placeholder="请输入学龄段：" name="inclass" id="inclass" /> <input
											type="button" value="确认" onclick="addclass()" />
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${loginUser.del==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#class3"><span
											class="glyphicon glyphicon-minus" aria-hidden="true"></span>
											删除学龄段： </a>
									</h4>
								</div>
								<div id="class3" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="delclass" value=""
													name="delclass" disabled /> <label for="delclass">全部</label>
												<c:forEach items="${selectAllClass}" varStatus="i"
													var="item">
													<input type="checkbox" id="delclass${i.index }"
														value="${item.classId }" name="delclass" />
													<label for="delclass${i.index }">${item.className }</label>
												</c:forEach>
											</div>
										</div>
										<p>
											<input type="button" style="float: right;" value="确认删除"
												onclick="delclass()" />
										</p>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							</c:if>
						</div>
					</div>

					<div class="tab-pane fade" id="point">
						<div class="panel-group" id="accordion2">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#point1"><span
											class="glyphicon glyphicon-search" aria-hidden="true"></span>
											检索考点(输入关键字，将会自动加载) </a>
									</h4>
								</div>
								<div id="point1" class="panel-collapse collapse in">
									<div class="panel-body">
										<input type="text" id="auto_txt" placeholder="请输入考点，默认为空"><br>
										<br>
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="selpoint" value="" disabled /> <label
													for="selpoint">全部</label>
												<div id="checkbox1"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<c:if test="${loginUser.upd==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#point2"><span
											class="glyphicon glyphicon-refresh" aria-hidden="true">更新考点(单选已修改的考点更新绑定旧题目)</a>
									</h4>
								</div>
								<div id="point2" class="panel-collapse collapse">
									<div class="panel-body">
										<p>
											<label for="updatePoint">旧的考点名称：</label><input type="text"
												id="updatePoint" placeholder="请输入旧的考点名称"> <span
												class="glyphicon glyphicon-share-alt" aria-hidden="true"
												id="alreadyUpdatePoint" style="color: blue"></span>
											{这将使原本旧题目包含(<span id="show" style="color: blue">？</span>)的考点修改为新考点(<span
												id="alreadyUpdatePoint2" style="color: blue">？</span>)}<input
												type="button" style="float: right;" value="确认更新"
												onclick="update_Point()" />
										</p>
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="delpoint" value=""
													name="delpoint" disabled /> <label for="delpoint">全部</label>
												<div id="checkbox2"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							</c:if>
							<c:if test="${loginUser.del==1}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" href="#point3"> <span
											class="glyphicon glyphicon-minus" aria-hidden="true"></span>
											删除考点(多选删除)
										</a>
									</h4>
								</div>
								<div id="point3" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="RadioStyle">
											<div class="Block PaddingL">
												<input type="checkbox" id="delpoint" value=""
													name="delpoint" disabled /> <label for="delpoint">全部</label>
												<div id="checkbox3"></div>
											</div>
										</div>
										<p>
											<input type="button" style="float: right;" value="确认删除"
												onclick="delpoint()" />
										</p>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							</c:if>
						</div>
					</div>
					<script type="text/javascript">
						function delpoint() {
							var chk_value = [];
							$('input[name="delpoint"]:checked').each(
									function() {
										chk_value.push($(this).val());
									});
							//console.log(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							// alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							$.ajax({
								type : "get",
								url : "point_del.do",
								traditional : true,//这里设置为true,传递数组
								data : {
									delpoint : chk_value
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("删除失败！");
								}
							});
						}
						function addclass() {
							$.ajax({
								type : "get",
								url : "class_add.do",
								data : {
									classname : $('#inclass').val()
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("添加失败！");
								}
							});
						}
						function delclass() {
							var chk_value = [];
							$('input[name="delclass"]:checked').each(
									function() {
										chk_value.push($(this).val());
									});
							//console.log(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							// alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							$.ajax({
								type : "get",
								url : "class_del.do",
								traditional : true,//这里设置为true
								data : {
									delclass : chk_value
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("删除失败！");
								}
							});
						}
						function insubject() {
							$.ajax({
								type : "get",
								url : "sub_add.do",
								data : {
									subname : $('#insubject').val()
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("添加失败！");
								}
							});
						}
						function delsubject() {
							var chk_value = [];
							$('input[name="delsubject"]:checked').each(
									function() {
										chk_value.push($(this).val());
									});
							//console.log(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							// alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							$.ajax({
								type : "get",
								url : "sub_del.do",
								traditional : true,//这里设置为true
								data : {
									delsubject : chk_value
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("删除失败！");
								}
							});
						}
						function insign() {
							$.ajax({
								type : "get",
								url : "sign_add.do",
								data : {
									artname : $('#juanbiao').val()
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("添加失败！");
								}
							});
						}
						function delsign() {
							var chk_value = [];
							$('input[name="delsign"]:checked').each(function() {
								chk_value.push($(this).val());
							});
							//console.log(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							// alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							$.ajax({
								type : "get",
								url : "sign_del.do",
								traditional : true,//这里设置为true
								data : {
									delsign : chk_value
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("删除失败！");
								}
							});
						}
						function addDate() {
							$.ajax({
								type : "get",
								url : "time_add.do",
								data : {
									indate : $('#indata').val()
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("添加失败！");
								}
							});
						}
						function delDate() {
							var chk_value = [];
							$('input[name="deldate"]:checked').each(function() {
								chk_value.push($(this).val());
							});
							console.log(chk_value.length == 0 ? '你还没有选择任何内容！'
									: chk_value);
							// alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
							$.ajax({
								type : "post",
								url : "time_del.do",
								traditional : true,//这里设置为true
								data : {
									deldate : chk_value
								},
								async : true,
								success : function(status) {
									console.log(status);
									if (status == "Success")
										window.location.href = "preSelect.do";
									else
										alert("删除失败！");
								}
							});
						}
					</script>
					<!-- 模糊搜索point -->
					<script src="searchPoint/delPoint.js"></script>

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
	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>
	<div class="alert"></div>
</body>

</html>
