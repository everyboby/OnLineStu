<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>考点视频上传</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

<script src="lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
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
.list {
	top: 15px;
	width: 140px;
	height: 40px;
	border: 1px solid #0082E6;
	display: inline-block;
	border-radius: 2px;
	position: relative;
	line-height: 40px;
}

#file {
	position: absolute;
	opacity: 0;
	color: white;
	width: 100%;
	height: 100%;
	z-index: 100;
}

.list span {
	display: inline-block;
	text-align: center;
	width: 100%;
	line-height: 40px;
	position: absolute;
	color: #0082E6;
}

video {
	margin-top: 8px;
	border-radius: 4px;
	width: 100%;
}

._p {
	margin: 14px;
}

._p span {
	font-size: 15px;
}

.row {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	flex-wrap: wrap;
}

.row>[class*='col-'] {
	display: flex;
	flex-direction: column;
}

#auto_div {
	position: absolute;
	border-width: 1px;
	border: 1px blue solid;
	border-width: 1px;
	z-index: 99999;
	background-color: #FFFFFF;
	border-radius: 4px;
	margin-top: 20px;
}
</style>
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
						style="position: relative; top: 3px;"></span>${loginUser.userName}
						<i class="fa fa-caret-down"></i>
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


	<div class="content" style="min-height: 850px">
		<div class="header">

			<h1 class="page-title">考点视频上传</h1>
			<ul class="breadcrumb">
				<li><a class="active">Home</a></li>
				<li>考点视频上传</li>
			</ul>

		</div>
		<div class="main-content">
			<div class="col-lg-12">
				<div class="row">
					<span>考点名称</span>：
					<div class="row head">
						<div class="col-lg-12">
							<div class="input-group">
								<input type="hidden" id="hidden"> <input type="text"
									id="auto_txt" class="form-control" placeholder="请输入考点关键字……"
									transparent autofocus x-webkit-speech>
								<div id="auto_div"></div>
								<span class="input-group-addon btn btn-default"
									onclick="searchPoint()"> <span
									class="glyphicon glyphicon-search"></span>
								</span>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="panel panel-default col-lg-8" style="padding: initial;">
						<div class="panel-heading">视频预览</div>
						<!--预览框-->
						<div class="panel-body">
							<div class="preview"></div>
						</div>
					</div>
					<div class="panel panel-default col-lg-4" style="padding: initial;">
						<div class="panel-heading">视频上传或修改</div>
						<!--预览框-->
						<div class="panel-body ">
							<p class="_p">
								<span>选择视频： </span>
								<!--文件选择按钮-->
								<a class="list" href="javascript:;"> <input id="file"
									type="file" name="myfile" onchange="UpladFile();" /><span>选择视频</span>
								</a>
								<!--上传速度显示-->
								<span id="time"></span>
							</p>
							<!--显示消失-->
							<ul class="el-upload-list el-upload-list--text"
								style="display: none;">
								<li tabindex="0" class="el-upload-list__item is-success"><a
									class="el-upload-list__item-name"> <i
										class="el-icon-document"></i><span id="videoName">food.jpeg</span>
								</a> <label class="el-upload-list__item-status-label"> <i
										class="el-icon-upload-success el-icon-circle-check"></i>
								</label> <i class="el-icon-close" onclick="del();"></i> <i
									class="el-icon-close-tip"></i></li>
							</ul>
							<!--进度条-->
							<div class="el-progress el-progress--line" style="display: none;">
								<div class="el-progress-bar">
									<div class="el-progress-bar__outer" style="height: 6px;">
										<div class="el-progress-bar__inner" style="width: 0%;"></div>
									</div>
								</div>
								<div class="el-progress__text" style="font-size: 14.4px;">0%</div>
							</div>
							<p class="_p">
								<span>上传视频</span>：
								<button class="btn btn-primary" type="button" onclick="sub();">上传</button>
							</p>
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
	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="application/javascript">
									function searchPoint(){
										if($('#auto_txt').val()!='' && $('#hidden').val()!=''){
											$.ajax({
												type : "post", // http请求方法,默认:"post"
												contentType : "application/json;charset=UTF-8",
												url : "selectById.do", // 发送请求的地址
												data : $('#hidden').val(),
												dataType : "json", // 预期服务器返回的数据类型
												async : true,
												success : function(data){
													//console.log(data.pointVideourl);
													var str=data.pointVideourl;
													if (str!="" && str!=null) {
														$(".preview").html("<video  controls='' autoplay='' name='media'><source src="+str+" type='video/mp4'></video>");
													} else {
														fail_prompt("Error:没有合适的视频！", 1200);
													}
												},
												error : function(){
													fail_prompt("Error:未找到合适结果！", 1200);
												}
											});
										}else{
											warning_prompt("Warning:考点不能为空！", 1200);
										}
									}
								
	
	</script>
	<script type="text/javascript">
		var xhr;//异步请求对象
		var ot; //时间
		var oloaded;//大小
		//上传文件方法
		function UpladFile() {
			var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
			var flag = false; //状态
			var arr = [ "mp4" ];
			if (fileObj.name) {
				var upFileName = fileObj.name;
				var index1 = upFileName.lastIndexOf(".");
				var index2 = upFileName.length;
				var suffix = upFileName.substring(index1 + 1, index2);//后缀名
				for (var i = 0; i < arr.length; i++) {
					if (suffix == arr[i]) {
						flag = true; //一旦找到合适的，立即退出循环
						break;
					}
				}
				//条件判断
				if (flag) {
					//console.log("文件名合法");
					$(".el-upload-list").css("display", "block");
					$(".el-upload-list li").css("border", "1px solid #20a0ff");
					$("#videoName").text(fileObj.name);
				} else {
					warning_prompt("Warning:文件名不合法！", 1200);
				}
			} else {
				warning_prompt("Warning:请选择文件！", 1200);
			}
		}
		/*点击取消*/
		function del() {
			$("#file").val('');
			$(".el-upload-list").css("display", "none");
		}
		/*点击提交*/
		function sub() {
			var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
			if (fileObj == undefined || fileObj == "") {
				warning_prompt("Warning:请选择文件！", 1200);
				return false;
			}
			;
			var auto_txt = $.trim($("#auto_txt").val());
			if (auto_txt == '') {
				warning_prompt("Warning:请填写考点名称！", 1200);
				return false;
			}
			var url = "upl_point_vi.do"; // 接收上传文件的后台地址 
			var form = new FormData(); // FormData 对象
			form.append("upfile", fileObj); // 文件对象 
			form.append("pointid",$('#hidden').val()); // 标题
			xhr = new XMLHttpRequest(); // XMLHttpRequest 对象
			xhr.open("post", url, true); //post方式，url为服务器请求地址，true 该参数规定请求是否异步处理。
			xhr.onload = uploadComplete; //请求完成
			xhr.onerror = uploadFailed; //请求失败
			xhr.upload.onprogress = progressFunction; //【上传进度调用方法实现】
			xhr.upload.onloadstart = function() { //上传开始执行方法
				ot = new Date().getTime(); //设置上传开始时间
				oloaded = 0; //设置上传开始时，以上传的文件大小为0
			};
			xhr.send(form); //开始上传，发送form数据
		}

		//上传进度实现方法，上传过程中会频繁调用该方法
		function progressFunction(evt) {
			// event.total是需要传输的总字节，event.loaded是已经传输的字节。如果event.lengthComputable不为真，则event.total等于0
			if (evt.lengthComputable) {
				$(".el-progress--line").css("display", "block");
				/*进度条显示进度*/
				$(".el-progress-bar__inner").css("width",
						Math.round(evt.loaded / evt.total * 100) + "%");
				$(".el-progress__text").html(
						Math.round(evt.loaded / evt.total * 100) + "%");
			}
			var time = document.getElementById("time");
			var nt = new Date().getTime(); //获取当前时间
			var pertime = (nt - ot) / 1000; //计算出上次调用该方法时到现在的时间差，单位为s
			ot = new Date().getTime(); //重新赋值时间，用于下次计算

			var perload = evt.loaded - oloaded; //计算该分段上传的文件大小，单位b 
			oloaded = evt.loaded; //重新赋值已上传文件大小，用以下次计算

			//上传速度计算
			var speed = perload / pertime; //单位b/s
			var bspeed = speed;
			var units = 'b/s'; //单位名称
			if (speed / 1024 > 1) {
				speed = speed / 1024;
				units = 'k/s';
			}
			if (speed / 1024 > 1) {
				speed = speed / 1024;
				units = 'M/s';
			}
			speed = speed.toFixed(1);
			//剩余时间
			var resttime = ((evt.total - evt.loaded) / bspeed).toFixed(1);
			time.innerHTML = '上传速度：' + speed + units + ',剩余时间：' + resttime
					+ 's';
			if (bspeed == 0)
				time.innerHTML = '上传已取消';
		}
		//上传成功响应
		function uploadComplete(evt) {
			//服务断接收完文件返回的结果  注意返回的字符串要去掉双引号
			var data = $.parseJSON(evt.target.responseText);
			console.log(data.state + "fwf" + data.url);
			if (data.state == "SUCCESS") {
				success_prompt("Success：上传成功！", 1200);
				$(".preview")
						.html(
								"<video  controls='' autoplay='' name='media'><source src="+data.url+" type='video/mp4'></video>");
			} else {
				fail_prompt("Error:上传失败！", 1200);
			}
		}
		//上传失败
		function uploadFailed(evt) {
			fail_prompt("Error:上传失败！", 1200);
		}
	</script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>
	<!-- 模糊搜索point -->
	<script src="searchPoint/searchPoint.js"></script>
	<div class="alert"></div>
</body>

</html>
