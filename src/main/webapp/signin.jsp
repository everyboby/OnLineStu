<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>登录</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
<!-- goodalert -->
<link rel="stylesheet" href="lib/goodalert/css/goodalert.css">
<script type="text/javascript" src="lib/goodalert/js/goodalert.js"></script>
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
	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a class="" href="#"><span class="navbar-brand"><img style="width:28px;heigt:28px;" src="images/logo.png">北京宝满分教育科技有限公司</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;"></div>
	</div>
	<div class="dialog">
		<div class="panel panel-default">
			<p class="panel-heading no-collapse">登录</p>
			<div class="panel-body">
				<form method="post" action="login.do" id="form">
					<div class="form-group">
						<label>用户名</label> <input type="text" name="userName" id="userName"
							class="form-control span12">
					</div>
					<div class="form-group">
						<label>密码</label> <input type="password" name="userPwd" id="userPwd"
							class="form-controlspan12 form-control">
					</div>
					<input type="button" class="btn btn-primary pull-right" value="登录" onclick="confirm()"/>
					<label class="remember-me"><input type="checkbox">
						记住我</label>
					<p style="color: red" align="center">${msg}</p>
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
	</div>
	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		function confirm(){
			if($("#userName").val()==null||$("#userName").val()==""){
				fail_prompt("用户名不能为空！",1200);
			}else if($("#userPwd").val()==null||$("#userPwd").val()==""){
				fail_prompt("密码不能为空",1200);
			}else{
				$("#form").submit();
			}
		}
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

