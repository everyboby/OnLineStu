<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>知识切片</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="lib/bootstrap/css/bootstrap-switch.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-3.3.1.min.js" type="text/javascript"></script>

<script src="lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".knob").knob();
	});
</script>
<link rel="stylesheet" href="page/myPagination.css">
<script src="page/myPagination.js"></script>
<link rel="stylesheet" type="text/css" href="lib/checkbox/build.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
<!--打印网页 -->
<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>
<!--switch -->
<script src="lib/bootstrap/js/bootstrap-switch.min.js"></script>
<!-- 模糊搜索point -->
<script src="searchPoint/searchPoint.js"></script>
<!-- goodalert -->
<link rel="stylesheet" href="lib/goodalert/css/goodalert.css">
<script type="text/javascript" src="lib/goodalert/js/goodalert.js"></script>
<style type="text/css" media=print>
a::after {
	
}

a[href]:after {
	content: normal;
}

.noprint {
	display: none
}
</style>
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
	line-height: 15px;
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

.bootstrap-switch-undefined {
	float: right;
	margin-right: 10px;
}

#auto_div {
	position: absolute;
	border-width: 1px;
	border: 1px blue solid;
	border-width: 1px;
	z-index: 99999;
	background-color: #FFFFFF;
}

#span {
	color: blue;
}

#span:hover {
	box-shadow: 0px 0px 20px currentcolor;
}
</style>
</head>

<body class=" theme-blue">

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
	<div class="navbar navbar-default noprint" role="navigation">
		<div class="navbar-header">
			<a class="" href="loginshow.do"><span class="navbar-brand"><img style="width:28px;heigt:28px;" src="images/logo.png">北京宝满分教育科技有限公司</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small"
						style="position: relative; top: 3px;"></span>${loginUser.userName}&nbsp;<i
						class="fa fa-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="logout.do">退出登录</a></li>
					</ul></li>
			</ul>

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
		<div class="header noprint">
			<h1 class="page-title">知识切片</h1>
			<ul class="breadcrumb">
				<li><a href="loginshow.do">Home</a></li>
				<li class="active">知识切片</li>
				<input name="my-sel2" type="checkbox" checked="checked"
					data-size="mini" style="float: right">
				<input name="my-sel" type="checkbox" checked="checked"
					data-size="mini" style="float: right">
			</ul>
		</div>
		<div class="col-lg-3 noprint">
			<div class="panel panel-default fadeInDown animation-delay2 noprint">
				<div class="panel-heading">检索</div>
				<div class="panel-body ">
					<input type="hidden" value="1" name="questId" />
					<ul class="nav nav-pills">
						<li><span><span class="fa fa-calendar"></span> 时间：</span></li>
						<li><select name="questFromTime" id="questFromTime">
								<option value="" selected>全部</option>
								<c:forEach items="${selectAllTime}" varStatus="i" var="item">
									<option value="${item.fromTime}">${item.fromTime}</option>
								</c:forEach>
						</select>
							<div class="clear"></div></li>
					</ul>
					<ul class="nav nav-pills">
						<li><span><span class="glyphicon glyphicon-bookmark"
								aria-hidden="true"></span>学龄段：</span></li>
						<li>
							<div class="RadioStyle">
								<div class="Block PaddingL">
									<input type="radio" name="questFromClass" id="class" value=""
										checked /> <label for="class">全部</label>
									<c:forEach items="${selectAllClass}" varStatus="i" var="item">
										<input type="radio" name="questFromClass"
											id="class${i.index }" value="${item.className}" />
										<label for="class${i.index }">${item.className}</label>
									</c:forEach>
									<div class="clear"></div>
								</div>
							</div>
						</li>
					</ul>
					<ul class="nav nav-pills">
						<li><span><span class="glyphicon glyphicon-file"
								aria-hidden="true"></span>卷标：</span></li>
						<li>
							<div class="RadioStyle">
								<div class="Block PaddingL">
									<input type="radio" name="questFromSign" id="sign" value=""
										checked /> <label for="sign">全部</label>
									<c:forEach items="${selectAllSign}" varStatus="i" var="item">
										<input type="radio" name="questFromSign" id="sign${i.index }"
											value="${item.signName}" />
										<label for="sign${i.index }">${item.signName}</label>
									</c:forEach>
									<div class="clear"></div>
								</div>
							</div>
						</li>
					</ul>
					<ul class="nav nav-pills">
						<li><span><span class="glyphicon glyphicon-list-alt"
								aria-hidden="true"></span>文理：</span></li>
						<li>
							<div class="RadioStyle">
								<div class="Block PaddingL">
									<input type="radio" name="questFromArts" id="arts1" value="文科理科"
										checked /> <label for="arts1">全部</label> <input type="radio"
										name="questFromArts" id="arts2" value="文科" /> <label
										for="arts2">文科</label> <input type="radio"
										name="questFromArts" id="arts3" value="理科" /> <label
										for="arts3">理科</label>
								</div>
							</div>
						</li>
					</ul>
					<ul class="nav nav-pills">
						<li><span><span class="glyphicon glyphicon-th-large"
								aria-hidden="true"></span> 科目：</span></li>
						<li>
							<div class="RadioStyle">
								<div class="Block PaddingL">
									<input type="radio" name="questFromSubject" id="selsubject"
										value="" checked /> <label for="selsubject">全部</label>
									<c:forEach items="${selectAllSubject}" varStatus="i" var="item">
										<input type="radio" name="questFromSubject"
											id="selsubject${i.index }" value="${item.subjectName}" />
										<label for="selsubject${i.index }">${item.subjectName }</label>
									</c:forEach>
									<div class="clear"></div>
								</div>
							</div>
						</li>
					</ul>
					<ul class="nav nav-pills">
						<li><span><span class="glyphicon glyphicon-asterisk"
								aria-hidden="true"></span> 题号：</span></li>
						<li><input id="quest_num" type="text" value=""
							name="questNumber" style="height: 23px" placeholder="请输入题号，默认为空" />
						</li>
					</ul>
					<ul class="nav nav-pills">
						<li><span><span class="glyphicon glyphicon-tags"
								aria-hidden="true"></span> 考点：</span> <input type="text" id="auto_txt"
							placeholder="请输入考点，默认为空"><span
							class="glyphicon glyphicon-plus-sign" aria-hidden="true"
							onclick="insertBox(1)" id="span"></span>
							<div id="auto_div"></div></li>
						<li>
							<div class="RadioStyle">
								<div class="Block PaddingL" id="checkbox">
									<input type="radio" id="selpoint" name="quest_point_Sum"
										value="" checked /> <label for="selpoint">全部</label>
								</div>
							</div>
						</li>
					</ul>
					<p>
						<button class="btn btn-warning" onclick="selectBycon(1)"
							id="select">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							查询
						</button>
					</p>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			window.onload = function() {
				selectBycon(1);
			}
			localPage = 1;
			selectPoint="";
			function selectByconNoPage() {
				var obj = {
					questFromTime : $("#questFromTime").val(),//时间
					questClass : $("input[name='questFromClass']:checked")
							.val(),//学龄段
					questFromSign : $("input[name='questFromSign']:checked")
							.val(),//卷标
					questFromArts : $("input[name='questFromArts']:checked")
							.val(),//文理
					questFromSubject : $(
							"input[name='questFromSubject']:checked").val(),//科目
					questNumber : $("#quest_num").val(),//题号
					questPoint : $("input[name='quest_point_Sum']:checked")
							.val()
				//考点
				};
				var jsonStr = JSON.stringify(obj);
				$
						.ajax({
							type : "post",
							url : "questFindAll.do",
							contentType : "application/json;charset=UTF-8",
							data : jsonStr,
							dataType : "json",
							async : true,
							success : function(data) {
								$("#showView").html("");
								$
										.each(
												data,
												function(i, item) {
													var index = i + 1;
													var statem = "<div class=\"post-summary\"><h3 style=\"margin-top: 0px;\">"
															+ index
															+ ".<a> ("
															+ item.questFromTime
															+ ","
															+ item.questFromSign
															+ ","
															+ item.questNumber
															+ ")</a></h3><strong>"
															+ item.questContent
															+ "</strong><br><div class=\"analysis\" style=\"display:none\">"
															+ item.detail_analysis
															+ "</div><p class=\"noprint\"><a href=\"showdetails.do?questId="
															+ item.questId
															+ "\" target=\"_blank\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"> 查看所有</span></a>&nbsp;&nbsp;&nbsp;"
															+ "<a onclick=\"confirmUpd("
															+ item.questId
															+ ")\"><span class=\"glyphicon fa fa-pencil\" aria-hidden=\"true\"> 编辑</span></a>&nbsp;&nbsp;&nbsp;"
															+ "<a href=\"javascript:void(0);\" onclick=\"confirmDel("
															+ item.questId
															+ ")\"><span class=\"glyphicon fa fa-trash-o  \" aria-hidden=\"true\"> 删除</span></a></p></div><hr class=\"noprint\" /></div>";
													$("#showView").append(
															statem);
												});
								$(".post-summary").trigger("create");
							}
						});
			}
			function selectBycon(pageNo) {
				if ("${selectpoint}" != null && selectPoint !="${selectpoint}") {
					selectPoint = "${selectpoint}";
				} else {
					selectPoint = $("input[name='quest_point_Sum']:checked")
							.val()
				}
				var obj = {
					questId : pageNo,//充当页码传给questinfo
					questFromTime : $("#questFromTime").val(),//时间
					questClass : $("input[name='questFromClass']:checked")
							.val(),//学龄段
					questFromSign : $("input[name='questFromSign']:checked")
							.val(),//卷标
					questFromArts : $("input[name='questFromArts']:checked")
							.val(),//文理
					questFromSubject : $(
							"input[name='questFromSubject']:checked").val(),//科目
					questNumber : $("#quest_num").val(),//题号
					questPoint : selectPoint
				//考点
				};
				var jsonStr = JSON.stringify(obj);
				$
						.ajax({
							type : "post",
							url : "questPageAll.do",
							contentType : "application/json;charset=UTF-8",
							data : jsonStr,
							dataType : "json",
							async : true,
							success : function(data) {
								$("#showView").html("");
								$
										.each(
												data.list,
												function(i, item) {
													var index = i
															+ 1
															+ (data.pageNum - 1)
															* data.pageSize;
													var statem = "<div class=\"post-summary\"><h3 style=\"margin-top: 0px;\">"
															+ index
															+ ".<a> ("
															+ item.questFromTime
															+ ","
															+ item.questFromSign
															+ ","
															+ item.questNumber
															+ ")</a></h3><strong>"
															+ item.questContent
															+ "</strong><br><div class=\"analysis\" style=\"display:none\">"
															+ item.detail_analysis
															+ "</div><p class=\"noprint\"><a href=\"showdetails.do?questId="
															+ item.questId
															+ "\" target=\"_blank\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"> 查看所有</span></a>&nbsp;&nbsp;&nbsp;"
															+ "<a onclick=\"confirmUpd("
															+ item.questId
															+ ")\"><span class=\"glyphicon fa fa-pencil\" aria-hidden=\"true\"> 编辑</span></a>&nbsp;&nbsp;&nbsp;"
															+ "<a href=\"javascript:void(0);\" onclick=\"confirmDel("
															+ item.questId
															+ ")\"><span class=\"glyphicon fa fa-trash-o  \" aria-hidden=\"true\"> 删除</span></a></p></div><hr class=\"noprint\" /></div>";
													$("#showView").append(
															statem);
												});
								var pagination = print(data);
								$("#showView").append(pagination);
								$(".post-summary").trigger("create");
							}
						});
			}
			function confirmUpd(questId) {
				if ("${loginUser.upd}" == 1) {
					window.open("showEdit.do?questId=" + questId);
				} else {
					warning_prompt("Warning:您当前没有修改权限！", 1200);
				}
			}
			function print(data) {
				localPage = data.pageNum;
				var pagination = "<div class=\"col-lg-8 col-lg-offset-2 noprint\">"
						+ "<div><ul class=\"pagination\" id=\"test\"><p>当前 "
						+ data.pageNum
						+ "页,总"
						+ data.pages
						+ "页,总"
						+ data.total
						+ "条记录</p><li><a onclick=\"selectBycon("
						+ data.firstPage
						+ ")\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span></a></li>";
				if (data.hasPreviousPage)
					pagination += "<li><a onclick=\"selectBycon("
							+ (data.pageNum - 1)
							+ ")\" aria-label=\"Previous\"><span aria-hidden=\"true\">&lt;</span></a></li>";
				for (var i = 1; i <= data.pages; i++)
					if (data.pageNum == i)
						pagination += "<li class=\"active\"><a>" + i
								+ "</a></li>";
					else
						pagination += "<li><a onclick=\"selectBycon(" + i
								+ ")\">" + i + "</a></li>";
				if (data.hasNextPage)
					pagination += "<li><a onclick=\"selectBycon("
							+ (data.pageNum + 1)
							+ ")\" aria-label=\"Previous\"><span aria-hidden=\"true\">&gt;</span></a></li>";
				pagination += "<li><a onclick=\"selectBycon("
						+ data.lastPage
						+ ")\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&raquo;</span></a></li></ul></div></div>";
				return pagination;
			}
		</script>
		<script type="text/javascript">
			$("[name='my-sel']").bootstrapSwitch({
				onText : '解析',
				offText : '题干',
				state : false
			});
			$('input[name="my-sel"]').on('switchChange.bootstrapSwitch',
					function(event, state) {
						if (state == true) {
							$(".analysis").each(function() {
								$(this).css('display', 'block');
							});
						} else {
							$(".analysis").each(function() {
								$(this).css('display', 'none');
							});
						}
					});
			$("[name='my-sel2']").bootstrapSwitch({
				onText : '不分页',
				offText : '分页',
				state : false
			});
			$('input[name="my-sel2"]').on(
					'switchChange.bootstrapSwitch',
					function(event, state) {
						if (state == true) {
							$("#select").removeAttr("onclick");
							$("#select").attr("onclick",
									"sele/*  */ctByconNoPage()");
							//console.log("vwewv"+localPage);
							selectByconNoPage();
						} else {
							$("#select").removeAttr("onclick");
							$("#select").attr("onclick", "selectBycon(1)");
							if (localPage != null)
								selectBycon(localPage);
							else
								selectBycon(1);
						}
					});
			function confirmDel(questId) {
				if ("${loginUser.del}" == 1){
					if(window.confirm("确认删除吗？")){
						$.ajax({
							type : "get",
							url : "delQuest.do",
							data : {
								questId : questId
							},
							async : true,
							success : function(status) {
								if (status == "Success")
									selectBycon(localPage);
								else
									fail_prompt("Fail:删除失败！", 1200);
							}
						});
					}
				} else {
					warning_prompt("Warning:您当前没有删除权限！", 1200);
				}
			}
		</script>
		<div class="col-lg-9" id="showView"></div>
		<footer class="noprint">
		<p align="center">
			©Copyright <a href="#" target="_blank">北京宝满分教育科技有限公司</a>
		</p>
		</footer>

	</div>

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
