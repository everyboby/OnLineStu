<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>题目编辑</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<!-- goodalert -->
<link rel="stylesheet" href="lib/goodalert/css/goodalert.css">
<script type="text/javascript" src="lib/goodalert/js/goodalert.js"></script>
<style type="text/css">
.iInput {
	position: absolute;
	border-bottom: 0px;
	border-right: 0px;
	border-left: 0px;
	border-top: 0px;
}

#span {
	color: blue;
}

#span:hover {
	box-shadow: 0px 0px 20px currentcolor;
}
</style>
<style type="text/css">
body {
	font: 14px/150% microsoft yahei, tahoma;
}

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

#auto_div {
	position: absolute;
	border-width: 1px;
	border: 1px blue solid;
	border-width: 1px;
	z-index: 99999;
	background-color: #FFFFFF;
}
</style>
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
<!--
        	作者：passionada
        	邮箱：everyboby98@163.com
        	时间：2018-11-17
        -->
<!--bwizard-->
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css"
	href="lib/bwizard/css/bwizard.min.css">
<link rel="stylesheet" type="text/css" href="lib/checkbox/build.css">
<!--ueditor-->
<script type="text/javascript" charset="utf-8"
	src="./ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/kityformula-plugin/getKfContent.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="./ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
.navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

</head>

<body class=" theme-blue" style="overflow-x: hidden;">

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
	<div class="navbar navbar-default" role="navigation"
		style="margin-left: -10px;">
		<div class="navbar-header">
			<a class="" href="loginshow.do"><span class="navbar-brand"><img
					style="width: 28px; heigt: 28px;" src="images/logo.png">北京宝满分教育科技有限公司</span></a>
		</div>
	</div>


	<div class="main-content" style="margin-left: 10px;">
		<div class="panel-header">
			<h1 class="page-title">题目编辑</h1>
			<ul class="breadcrumb">
				<li class="active">Home</li>
				<li class="active">题目编辑</li>
			</ul>
		</div>
		<div class="panel-body">
			<div class="input-group col-lg-12">
				<form:form action="ueditor.do" method="post"
					enctype="multipart/form-data" id="questform">
					<table>
						<tr>
							<ul class="nav nav-pills">
								<li><input type="hidden" value="${questinfo.questId }"
									name="questId" /></li>
								<li><span><span class="fa fa-calendar"></span> 时间：</span></li>
								<li><select name="questFromTime" class="questFromTime">
										<option value="" selected>全部</option>
										<c:forEach items="${selectAllTime}" varStatus="i" var="item">
											<option value="${item.fromTime}">${item.fromTime}</option>
										</c:forEach>
								</select>
									<div class="clear"></div></li>
							</ul>
						</tr>
						<tr>
							<ul class="nav nav-pills">
								<li><span><span class="glyphicon glyphicon-bookmark"
										aria-hidden="true"></span>学龄段：</span></li>
								<li><div class="RadioStyle">
										<div class="Block PaddingL">
											<input type="radio" name="questClass" id="class" value=""
												checked /> <label for="class">全部</label>
											<c:forEach items="${selectAllClass}" varStatus="i" var="item">
												<input type="radio" name="questClass" id="class${i.index }"
													value="${item.className}" />
												<label for="class${i.index }">${item.className}</label>
											</c:forEach>
											<div class="clear"></div>
										</div>
									</div></li>
							</ul>
						</tr>
						<tr>
							<ul class="nav nav-pills">
								<li><span><span class="glyphicon glyphicon-file"
										aria-hidden="true"></span>卷标：</span></li>
								<li><div class="RadioStyle">
										<div class="Block PaddingL">
											<input type="radio" name="questFromSign" id="sign" value=""
												checked /> <label for="sign">全部</label>
											<c:forEach items="${selectAllSign}" varStatus="i" var="item">
												<input type="radio" name="questFromSign"
													id="sign${i.index }" value="${item.signName}" />
												<label for="sign${i.index }">${item.signName}</label>
											</c:forEach>
											<div class="clear"></div>
										</div>
									</div></li>
							</ul>
						</tr>
						<tr>
							<ul class="nav nav-pills">
								<li><span><span class="glyphicon glyphicon-list-alt"
										aria-hidden="true"></span>文理：</span></li>
								<li><div class="RadioStyle">
										<div class="Block PaddingL">
											<input type="radio" name="questFromArts" id="arts1"
												value="文科理科" checked /> <label for="arts1">全部</label> <input
												type="radio" name="questFromArts" id="arts2" value="文科" />
											<label for="arts2">文科</label> <input type="radio"
												name="questFromArts" id="arts3" value="理科" /> <label
												for="arts3">理科</label>
										</div>
									</div></li>
							</ul>
						</tr>
						<tr>
							<ul class="nav nav-pills">
								<li><span><span class="glyphicon glyphicon-th-large"
										aria-hidden="true"></span> 科目：</span></li>
								<li><div class="RadioStyle">
										<div class="Block PaddingL">
											<input type="radio" name="questFromSubject" id="selsubject"
												value="" checked /> <label for="selsubject">全部</label>
											<c:forEach items="${selectAllSubject}" varStatus="i"
												var="item">
												<input type="radio" name="questFromSubject"
													id="selsubject${i.index }" value="${item.subjectName}" />
												<label for="selsubject${i.index }">${item.subjectName }</label>
											</c:forEach>
											<div class="clear"></div>
										</div>
									</div></li>
							</ul>
						</tr>
						<tr>
							<ul class="nav nav-pills">
								<li><span><span class="glyphicon glyphicon-asterisk"
										aria-hidden="true"></span> 题号：</span></li>
								<li><input id="quest_num" type="text" value=""
									name="questNumber" style="height: 23px"
									placeholder="请输入题号，默认为空" /></li>
							</ul>
						</tr>
						<tr>
							<ul class="nav nav-pills">
								<li><span><span class="glyphicon glyphicon-tags"
										aria-hidden="true"></span> 考点：</span> <input type="text"
									id="auto_txt" placeholder="请输入考点，默认为空" style="height: 23px">
									<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"
									onclick="insertBox(0)" id="span"></span>
									<div id="auto_div"></div></li>
								<li>
									<div class="RadioStyle">
										<div class="Block PaddingL" id="checkbox">
											<input type="checkbox" id="selpoint" name="quest_point_Sum"
												value="" checked /> <label for="selpoint">全部</label>
										</div>
									</div>
								</li>
							</ul>
						</tr>
					</table>
					<br>
					<div id="wizard">
						<ol>
							<li>题干</li>
							<li>题目解析</li>
							<li>修改提交</li>
						</ol>
						<div>
							<script id="editor1" name="questContent" type="text/plain"
								style="width:100%;height:300;"></script>
						</div>
						<div>
							<script id="editor2" name="detail_analysis" type="text/plain"
								style="width:100%;height:600;"></script>
						</div>
						<div>
							<button type="button" onclick='doSubmitForm()'>提交</button>
						</div>
					</div>

				</form:form>
			</div>

		</div>
	</div>
	<code id="questContent" style="display: none;">
		${questinfo.questContent} </code>
	<code id="detail_analysis" style="display: none;">
		${questinfo.detail_analysis} </code>
	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="lib/bwizard/js/bwizard.min.js"></script>
	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		//var ue = UE.getEditor('editor1');{ initialFrameWidth:910   }
		var ue = new baidu.editor.ui.Editor({
			initialFrameHeight : 300
		});
		ue.render("editor1");
		var ue2 = new baidu.editor.ui.Editor({
			initialFrameHeight : 300
		});
		ue2.render("editor2");
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
		UE.Editor.prototype.getActionUrl = function(action) {
			if (action == 'uploadimage') {
				return 'http://' + window.location.host
						+ '/onLineStu/uploadimage.do';
			} else if (action == 'uploadvideo') {
				return 'http://' + window.location.host
						+ '/onLineStu/uploadvideo.do';
			} else {
				return this._bkGetActionUrl.call(this, action);
			}
		}
		//提交
		function doSubmitForm() {
			if (UE.getEditor('editor1').hasContents())
				if (UE.getEditor('editor2').hasContents())
					$("#questform").submit();
				else
					warning_prompt("Warning:题目解析不能为空！", 1200);
			else {
				warning_prompt("Warning:题干不能为空！", 1200);
			}
		}
	</script>
	<script type="text/javascript">
		$("#wizard").bwizard();
	</script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>
	<script type="text/javascript">
		//初始化
		window.onload = function() {
			$(".questFromTime").val("${questinfo.questFromTime}");
			$("[name='questClass'][value='${questinfo.questClass}']").prop(
					"checked", "checked");
			$("[name='questFromSign'][value='${questinfo.questFromSign}']")
					.prop("checked", "checked");
			$("[name='questFromArts'][value='${questinfo.questFromArts}']")
					.prop("checked", "checked");
			$("[name='questFromSubject'][value='${questinfo.questFromSubject}']")
					.prop("checked", "checked");
			$("#quest_num").val("${questinfo.questNumber}");
			//考点
			var questpoint = "${questinfo.questPoint}";
			var PointArray = questpoint.split(",");
			for (var i = 0; i < PointArray.length; i++) {
				if (PointArray[i] != "" && PointArray[i] != null) {
					var str = "<input type=\"checkbox\" id=\"selpoint"
						+i+"\" name=\"quest_point_Sum\" value=\""
						+PointArray[i]+"\" checked /> <label for=\"selpoint"+i+"\">"
							+ PointArray[i] + "</label>";
					$("#checkbox").append(str);
				}
			}
			UE.getEditor('editor1').execCommand('insertHtml',
					$("#questContent").html());
			UE.getEditor('editor2').execCommand('insertHtml',
					$("#detail_analysis").html());
		};
	</script>
	<!-- 模糊搜索point -->
	<script src="searchPoint/searchPoint.js"></script>
	<div class="alert"></div>
	<footer class="bs-docs-footer">
	<div class="container">
		<p align="center">
			©Copyright <a href="#" target="_blank">北京宝满分教育科技有限公司</a>
		</p>
	</div>
	</footer>
</body>

</html>
