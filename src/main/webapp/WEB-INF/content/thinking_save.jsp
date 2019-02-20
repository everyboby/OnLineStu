<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>新建-思维导图</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="lib/bootstrap/css/bootstrap-switch.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="lib/goodalert/css/goodalert.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script src="lib/bootstrap/js/bootstrap-switch.min.js"></script>
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
<!--thinking-->
<script src="./thinking/release/go.js"></script>
<script id="code">
	function init() {
		var $ = go.GraphObject.make;

		myDiagram = $(go.Diagram, "myDiagramDiv", {
			padding : 20,
			// when the user drags a node, also move/copy/delete the whole subtree starting with that node
			"commandHandler.copiesTree" : true,
			"commandHandler.deletesTree" : true,
			"draggingTool.dragsTree" : true,
			initialContentAlignment : go.Spot.Center, // center the whole graph
			"undoManager.isEnabled" : true
		});

		// when the document is modified, add a "*" to the title and enable the "Save" button
		myDiagram.addDiagramListener("Modified", function(e) {
			var button = document.getElementById("SaveButton");
			if (button)
				button.disabled = !myDiagram.isModified;
			var idx = document.title.indexOf("*");
			if (myDiagram.isModified) {
				if (idx < 0)
					document.title += "*";
			} else {
				if (idx >= 0)
					document.title = document.title.substr(0, idx);
			}
		});

		// a node consists of some text with a line shape underneath
		myDiagram.nodeTemplate = $(go.Node, "Vertical", {
			selectionObjectName : "TEXT",
		}, $(go.TextBlock, {
			name : "TEXT",
			minSize : new go.Size(30, 15),
			editable : true
		},
		// remember not only the text string but the scale and the font in the node data
		new go.Binding("text", "text").makeTwoWay(), new go.Binding("scale",
				"scale").makeTwoWay(), new go.Binding("font", "font")
				.makeTwoWay()), $(go.Shape, "LineH", {
			stretch : go.GraphObject.Horizontal,
			strokeWidth : 3,
			height : 3,
			// this line shape is the port -- what links connect with
			portId : "",
			fromSpot : go.Spot.LeftRightSides,
			toSpot : go.Spot.LeftRightSides
		}, new go.Binding("stroke", "brush"),
		// make sure links come in from the proper direction and go out appropriately
		new go.Binding("fromSpot", "dir", function(d) {
			return spotConverter(d, true);
		}), new go.Binding("toSpot", "dir", function(d) {
			return spotConverter(d, false);
		})),
		// remember the locations of each node in the node data
		new go.Binding("location", "loc", go.Point.parse)
				.makeTwoWay(go.Point.stringify),
		// make sure text "grows" in the desired direction
		new go.Binding("locationSpot", "dir", function(d) {
			return spotConverter(d, false);
		}));

		// selected nodes show a button for adding children
		myDiagram.nodeTemplate.selectionAdornmentTemplate = $(go.Adornment,
				"Spot", $(go.Panel, "Auto",
				// this Adornment has a rectangular blue Shape around the selected node
				$(go.Shape, {
					fill : null,
					stroke : "dodgerblue",
					strokeWidth : 3
				}), $(go.Placeholder, {
					margin : new go.Margin(4, 4, 0, 4)
				})),
				// and this Adornment has a Button to the right of the selected node
				$("Button", {
					alignment : go.Spot.Right,
					alignmentFocus : go.Spot.Left,
					click : addNodeAndLink
				// define click behavior for this Button in the Adornment
				}, $(go.TextBlock, "+", // the Button content
				{
					font : "bold 8pt sans-serif"
				})));

		// the context menu allows users to change the font size and weight,
		// and to perform a limited tree layout starting at that node
		myDiagram.nodeTemplate.contextMenu = $(go.Adornment, "Vertical", $(
				"ContextMenuButton", $(go.TextBlock, "变大"), {
					click : function(e, obj) {
						changeTextSize(obj, 1.1);
					}
				}), $("ContextMenuButton", $(go.TextBlock, "缩放"), {
			click : function(e, obj) {
				changeTextSize(obj, 1 / 1.1);
			}
		}), $("ContextMenuButton", $(go.TextBlock, "粗体/正常"), {
			click : function(e, obj) {
				toggleTextWeight(obj);
			}
		}), $("ContextMenuButton", $(go.TextBlock, "自适应"), {
			click : function(e, obj) {
				var adorn = obj.part;
				adorn.diagram.startTransaction("Subtree Layout");
				layoutTree(adorn.adornedPart);
				adorn.diagram.commitTransaction("Subtree Layout");
			}
		}));

		// a link is just a Bezier-curved line of the same color as the node to which it is connected
		myDiagram.linkTemplate = $(go.Link, {
			curve : go.Link.Bezier,
			fromShortLength : -2,
			toShortLength : -2,
			selectable : false
		}, $(go.Shape, {
			strokeWidth : 3
		}, new go.Binding("stroke", "toNode", function(n) {
			if (n.data.brush)
				return n.data.brush;
			//								else
			//									return colorBox[Math.floor((Math.random() * colorBox.length))];
			return "black";
		}).ofObject()));

		// the Diagram's context menu just displays commands for general functionality
		myDiagram.contextMenu = $(go.Adornment, "Vertical", $(
				"ContextMenuButton", $(go.TextBlock, "Undo"), {
					click : function(e, obj) {
						e.diagram.commandHandler.undo();
					}
				}, new go.Binding("visible", "", function(o) {
					return o.diagram && o.diagram.commandHandler.canUndo();
				}).ofObject()), $("ContextMenuButton", $(go.TextBlock, "Redo"),
				{
					click : function(e, obj) {
						e.diagram.commandHandler.redo();
					}
				}, new go.Binding("visible", "", function(o) {
					return o.diagram && o.diagram.commandHandler.canRedo();
				}).ofObject()), $("ContextMenuButton", $(go.TextBlock, "Save"),
				{
					click : function(e, obj) {
						save();
					}
				}), $("ContextMenuButton", $(go.TextBlock, "Load"), {
			click : function(e, obj) {
				load();
			}
		}));

		myDiagram.addDiagramListener("SelectionMoved", function(e) {
			var rootX = myDiagram.findNodeForKey(0).location.x;
			myDiagram.selection.each(function(node) {
				if (node.data.parent !== 0)
					return; // Only consider nodes connected to the root
				var nodeX = node.location.x;
				if (rootX < nodeX && node.data.dir !== "right") {
					updateNodeDirection(node, "right");
				} else if (rootX > nodeX && node.data.dir !== "left") {
					updateNodeDirection(node, "left");
				}
				layoutTree(node);
			});
		});

		// read in the predefined graph using the JSON format data held in the "mySavedModel" textarea
		load();
	}

	function spotConverter(dir, from) {
		if (dir === "left") {
			return (from ? go.Spot.Left : go.Spot.Right);
		} else {
			return (from ? go.Spot.Right : go.Spot.Left);
		}
	}

	function changeTextSize(obj, factor) {
		var adorn = obj.part;
		adorn.diagram.startTransaction("Change Text Size");
		var node = adorn.adornedPart;
		var tb = node.findObject("TEXT");
		tb.scale *= factor;
		adorn.diagram.commitTransaction("Change Text Size");
	}

	function toggleTextWeight(obj) {
		var adorn = obj.part;
		adorn.diagram.startTransaction("Change Text Weight");
		var node = adorn.adornedPart;
		var tb = node.findObject("TEXT");
		// assume "bold" is at the start of the font specifier
		var idx = tb.font.indexOf("bold");
		if (idx < 0) {
			tb.font = "bold " + tb.font;
		} else {
			tb.font = tb.font.substr(idx + 5);
		}
		adorn.diagram.commitTransaction("Change Text Weight");
	}

	function updateNodeDirection(node, dir) {
		myDiagram.model.setDataProperty(node.data, "dir", dir);
		// recursively update the direction of the child nodes
		var chl = node.findTreeChildrenNodes(); // gives us an iterator of the child nodes related to this particular node
		while (chl.next()) {
			updateNodeDirection(chl.value, dir);
		}
	}

	//color array
	colorBox = [ "skyblue", "cyan", "lightcyan", "right", "darkseagreen",
			"palevioletred", "coral" ];
	colorReplace = [];

	function getSimpleColor() {
		if (colorBox.length > 0) {

			var col1_num = Math.floor((Math.random() * colorBox.length));
			//选中的颜色
			var col1 = colorBox[col1_num];
			colorReplace.push(col1);
			colorBox[col1_num] = colorBox[colorBox.length - 1];
			colorBox = colorBox.splice(0, colorBox.length - 1);
			return col1;
		} else {
			temp = colorReplace;
			colorReplace = [];
			colorBox = temp;
			//重复上边操作
			var col1_num = Math.floor((Math.random() * colorBox.length));
			//选中的颜色
			var col1 = colorBox[col1_num];
			colorReplace.push(col1);
			colorBox[col1_num] = colorBox[colorBox.length - 1];
			colorBox = colorBox.splice(0, colorBox.length - 1);
			return col1;
		}
	}

	function addNodeAndLink(e, obj) {
		var adorn = obj.part;
		var diagram = adorn.diagram;
		diagram.startTransaction("Add Node");
		var oldnode = adorn.adornedPart;
		var olddata = oldnode.data;
		var olddata_buush = oldnode.data.brush;
		if (oldnode.data.brush && oldnode.data.brush != "black")
			olddata_buush = oldnode.data.brush;
		else
			olddata_buush = getSimpleColor();
		// copy the brush and direction to the new node data
		var newdata = {
			text : "idea",
			brush : olddata_buush,
			dir : olddata.dir,
			parent : olddata.key
		};
		diagram.model.addNodeData(newdata);
		layoutTree(oldnode);
		diagram.commitTransaction("Add Node");

		// if the new node is off-screen, scroll the diagram to show the new node
		var newnode = diagram.findNodeForData(newdata);
		if (newnode !== null)
			diagram.scrollToRect(newnode.actualBounds);
	}

	function layoutTree(node) {
		if (node.data.key === 0) { // adding to the root?
			layoutAll(); // lay out everything
		} else { // otherwise lay out only the subtree starting at this parent node
			var parts = node.findTreeParts();
			layoutAngle(parts, node.data.dir === "left" ? 180 : 0);
		}
	}

	function layoutAngle(parts, angle) {
		var layout = go.GraphObject.make(go.TreeLayout, {
			angle : angle,
			arrangement : go.TreeLayout.ArrangementFixedRoots,
			nodeSpacing : 5,
			layerSpacing : 20,
			setsPortSpot : false, // don't set port spots since we're managing them with our spotConverter function
			setsChildPortSpot : false
		});
		layout.doLayout(parts);
	}

	function layoutAll() {
		var root = myDiagram.findNodeForKey(0);
		if (root === null)
			return;
		myDiagram.startTransaction("Layout");
		// split the nodes and links into two collections
		var rightward = new go.Set(go.Part);
		var leftward = new go.Set(go.Part);
		root.findLinksConnected().each(function(link) {
			var child = link.toNode;
			if (child.data.dir === "left") {
				leftward.add(root); // the root node is in both collections
				leftward.add(link);
				leftward.addAll(child.findTreeParts());
			} else {
				rightward.add(root); // the root node is in both collections
				rightward.add(link);
				rightward.addAll(child.findTreeParts());
			}
		});
		// do one layout and then the other without moving the shared root node
		layoutAngle(rightward, 0);
		layoutAngle(leftward, 180);
		myDiagram.commitTransaction("Layout");
	}

	// Show the diagram's model in JSON format
	localThinkData = 0;//用来记录当前保存后的长度
	submitThinkData = 0;//用来记录上一次提交的长度，用来避免二次重复提交
	function save() {
		document.getElementById("mySavedModel").value = myDiagram.model
				.toJson();
		//console.log("save" + document.getElementById("mySavedModel").value);
		localThinkData = document.getElementById("mySavedModel").value.length;
		myDiagram.isModified = false;
	}

	function load() {
		myDiagram.model = go.Model.fromJson(document
				.getElementById("mySavedModel").value);
	}
	function toimg() {
		img = myDiagram.makeImage({
			scale : 1,
			background : "AntiqueWhite",
			type : "image/jpeg",
			maxSize: new go.Size(Infinity, Infinity)
		});
		var url = img.src;
		var a = document.createElement('a');
		var event = new MouseEvent('click');
		a.download = '下载图片名称';
		a.href = url;
		a.dispatchEvent(event);
	}
	function rutimg() {
		var img = myDiagram.makeImage({
			scale : 1,
		});
		return img.src;
	}
</script>

</head>

<body class=" theme-blue" onload="init()" style="overflow-x: hidden;">
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
						style="position: relative; top: 3px;"></span>${loginUser.userName}<i
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
		<div class="header">

			<h1 class="page-title">新建-思维导图</h1>
			<ul class="breadcrumb">
				<li><a href="loginshow.do">Home</a></li>
				<li><a href="thinkAll.do">思维导图</a></li>
				<li>新建</li>
			</ul>
		</div>
		<div id="sample">
			<input id="thinking_username" type="hidden"
				value="${loginUser.userName}" /> <input value=""
				id="thinking_title" type="text"
				style="text-align: center; padding: 10px 20px; width: 100%;"
				placeholder="请输入思维导图标题" />
			<div id="myDiagramDiv"
				style="border: solid 1px #999999; width: 100%; height: 400px; pointer-events: none;"></div>
			<br />
			<div>
				<button id="SaveButton" onclick="save()">保存</button>
				<button onclick="load()">加载</button>
				<button onclick="layoutAll()">自适应布局</button>
				<button onclick="toimg()">下载图片</button>
				<button style="float: right;" onclick="updateSubmit()">提交</button>
				<div class="col-sm-6 col-lg-4">
					<p>
						<input name="my-sel" type="checkbox" checked="checked"
							data-size="mini">
					</p>
				</div>
			</div>
		</div>
		<textarea id="mySavedModel"
			style="width: 100%; height: 400px; display: none;">
{ "class": "go.TreeModel",
  "nodeDataArray": [
{"key":0, "text":"标题一", "loc":"0 0"}
 ]
}
  </textarea>
	</div>
	<div class="alert"></div>
	<footer>
	<hr>
	<p align="center">
		©Copyright <a href="#" target="_blank">北京宝满分教育科技有限公司</a>
	</p>
	</footer>
	<script type="text/javascript" src="lib/goodalert/js/goodalert.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
		$("[name='my-sel']").bootstrapSwitch({
			onText : '解锁',
			offText : '锁定',
			state : false
		});
		$('input[name="my-sel"]').on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state == true) {
						console.log('打开');
						$('#myDiagramDiv').css('pointer-events', 'auto');
					} else {
						console.log('关闭');
						$('#myDiagramDiv').css('pointer-events', 'none');
					}
				});
		function replaceDateToString(date) {
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			m = m < 10 ? ('0' + m) : m;
			var d = date.getDate();
			d = d < 10 ? ('0' + d) : d;
			var h = date.getHours();
			var minute = date.getMinutes();
			minute = minute < 10 ? ('0' + minute) : minute;
			var second = date.getSeconds();
			second = minute < 10 ? ('0' + second) : second;
			return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':'
					+ second;
		};
		function updateSubmit() {
			var imgentiy = rutimg();
			var time = replaceDateToString(new Date());
			if (localThinkData != submitThinkData) {
				if ($('#thinking_title').val() != null
						&& $('#thinking_title').val() != "") {
					$.ajax({
						type : "post",
						url : "thinking_save.do",
						data : {
							thinkTheme : $('#thinking_title').val(),
							thinkdate : time,
							thinkData : $('#mySavedModel').val(),
							thinkUserName : $('#thinking_username').val(),
							thinkImg : imgentiy
						},
						dataType : "json",
						async : true,
						success : function(data) {
							submitThinkData = $('#mySavedModel').val().length;
							if (data.status == "Success") {
								success_prompt("Success：思维导图建立成功！", 1200);
							} else {
								fail_prompt("Error:思维导图建立失败！", 1200);
							}
						},
						error : function(data) {
							fail_prompt("Error:思维导图建立失败！", 1200);
						}
					});
				} else {
					warning_prompt("Warning:标题不能为空！", 1200);
				}
			} else {
				if (submitThinkData == 0)
					warning_prompt("Warning:您当前未建立任何操作！", 1200);
				else
					warning_prompt("Warning:您已提交，请勿重复提交！", 1200);
			}
		}
	</script>

</body>

</html>
