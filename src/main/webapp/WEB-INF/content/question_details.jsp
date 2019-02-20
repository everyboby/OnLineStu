<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>题目详情</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="page/myPagination.css">
<script src="page/myPagination.js"></script>
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
<style type="text/css">
.vid-wrap video {
	position: relative;
	left: 10%;
	width: 65%;
	height:auto;
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
	<div class="navbar navbar-default" role="navigation" style="margin-left: -10px;">
		<div class="navbar-header">
			<a class="" href="loginshow.do"><span class="navbar-brand"><img style="width:28px;heigt:28px;" src="images/logo.png">北京宝满分教育科技有限公司</span></a>
		</div>
	</div>
<div class="main-content" style="margin-left: 10px;">
		<div class="panel-header">

			<h1 class="page-title">题目详情</h1>
			<ul class="breadcrumb">
				<li class="active">Home</li>
				<li class="active">详情</li>
			</ul>

		</div>
		
			<div class="post-summary" style="margin-left: 10px;">
				<h3 style="margin-top: 0px;">
					<a href="#">(${questinfo.questFromTime},${questinfo.questFromSign },${questinfo.questNumber })</a>
				</h3>
				<div>
					<strong>${questinfo.questNumber}.${questinfo.questContent}</strong> <br /> <br />
				</div>
				<div class="panel panel-danger">
					<div class="panel-heading">答案解析</div>
					<div class="panel-body">
						<div class="col-lg-12">${questinfo.detail_analysis}</div>
					</div>
					<div class="panel-heading">视频解析</div>
					<div class="vid-wrap">
						<video controls preload> <source
							src="${questinfo.quest_videoUrl}" type="video/mp4"></video>
					</div>
				</div>
				<div class="alert alert-danger" role="alert">
					<strong>考点:</strong>
					<ul id="questPoint">
						
					</ul>

				</div>
			</div>
		</div>
		<script type="text/javascript">
			window.onload=function(){
				var questpoint ="${questinfo.questPoint}";
				var PointArray = questpoint.split(",");
				for(var i=0;i<PointArray.length;i++){
					if(PointArray[i] != "" && PointArray[i] != null)
			        	$("#questPoint").append("<li><a href=\"questinfo.do?selectpoint="+PointArray[i]+"\" class=\"alert-link\">"+PointArray[i]+"</a></li>");
			    }
			}
		</script>
		<footer>
		<hr>

		<p>
			© 2018 <a href="#" target="_blank">公司名</a>
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

</body>

</html>
