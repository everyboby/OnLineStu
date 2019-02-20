/**
 * @author everybody98@163.com
 */
// 高亮的索引
var highLightIndex = -1;
// 超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效）
var timeoutId;
var value = "";// append添加，防止重复添加

$(document).ready(function() {
	$('#auto_txt').bind('keyup', processKeyup);
});

/**
 * 处理键盘按下后弹起的事件
 * 
 * @param event
 */
function processKeyup(event) {
	var myEvent = event || windows.event;
	var keyCode = myEvent.keyCode;
	// 输入是字母，或者退格键则需要重新请求
	if (keyCode == 229 || keyCode == 32 || keyCode == 8 || (keyCode > 47 && keyCode < 58)
			|| (keyCode > 64 && keyCode < 91) ||(keyCode > 95 && keyCode < 106)) {
		// 以下两行代码是为了防止用户快速输入导致频繁请求服务器
		// 这样便可以在用户500ms内快速输入的情况下，只请求服务器一次
		// 大大提高服务器性能
		highLightIndex = -1;
		clearTimeout(timeoutId);
		timeoutId = setTimeout(processAjaxRequest, 1000);
		// 处理上下键(up,down)
	} else if (keyCode == 38 || keyCode == 40) {
		processKeyUpAndDown(keyCode);
		// 按下了回车键
	} else if (keyCode == 13) {
		processEnter();
	}
}

/**
 * 处理Ajax请求
 * 
 * @param data
 */
function processAjaxRequest() {
	var obj = {
		reqWord : $('#auto_txt').val()
	};
	var jsonStr = JSON.stringify(obj);
	if ($('#auto_txt').val() != null && $('#auto_txt').val() != "")
		$.ajax({
			type : "post", // http请求方法,默认:"post"
			contentType : "application/json;charset=UTF-8",
			url : "selectPointByCon.do", // 发送请求的地址
			data : $('#auto_txt').val(),
			dataType : "json", // 预期服务器返回的数据类型
			success : processAjaxResponse
		});
}

/**
 * 处理Ajax回复
 * 
 * @param data
 *            Ajax请求得到的返回结果为dom文档对象
 */
function processAjaxResponse(data) {
	$("#checkbox1").html("");
	$("#checkbox2").html("");
	$("#checkbox3").html("");
	$.each(data, function(i, item) {
		var str1 = "<input type=\"checkbox\" id=\"showpoint" + item.pointId
				+ "\"  value=\"" + item.pointId
				+ "\" disabled/><label for=\"showpoint" + item.pointId + "\">"
				+ item.pointName + "</label>";
		var str2 = "<input type=\"radio\" id=\"flashpoint" + item.pointId
				+ "\" name=\"flashpoint\" value=\"" + item.pointName
				+ "\"/><label for=\"flashpoint" + item.pointId + "\">"
				+ item.pointName + "</label>";
		var str3 = "<input type=\"checkbox\" id=\"delpoint" + item.pointId
				+ "\" name=\"delpoint\" value=\"" + item.pointId
				+ "\"/><label for=\"delpoint" + item.pointId + "\">"
				+ item.pointName + "</label>";
		$("#checkbox1").append(str1);
		$("#checkbox2").append(str2);
		$("#checkbox3").append(str3);
		$('input[id=flashpoint' + item.pointId + ']').click(function() {
			$("#alreadyUpdatePoint").html($(this).val());
			$("#alreadyUpdatePoint2").html($(this).val());
		});
	});
}
$(function() {
	// 输入框的值改变时触发
	$("#updatePoint").on("input", function(e) {
		// 获取input输入的值
		$("#show").html(e.delegateTarget.value);
	});
});
function update_Point(){
//	console.log($('#alreadyUpdatePoint2').val()+ $('#show').val());
	//更新
	$.ajax({
		type : "post",
		url : "updatePoint.do",
		data : {
			alreadyUpdatePoint2 : $('#alreadyUpdatePoint2').text(),
			show : $('#show').text(),
		},
		dataType : "json",
		async : true,
		success : function(data) {
			if (data.status == "Success") {
				success_prompt("Success：考点更新成功！", 1200);
			} else {
				fail_prompt("Error:考点更新失败！", 1200);
			}
		},
		error : function(data) {
			fail_prompt("Error:考点2更新失败！", 1200);
		}
	});
}
