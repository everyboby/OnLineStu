/**
 * @author everybody98@163.com
 */
// 高亮的索引
var highLightIndex = -1;
// 超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效）
var timeoutId;
var value = "";// append添加，防止重复添加

$(document).ready(function() {
	init();
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
		timeoutId = setTimeout(processAjaxRequest, 500);
		// 处理上下键(up,down)
	} else if (keyCode == 38 || keyCode == 40) {
		processKeyUpAndDown(keyCode);
		// 按下了回车键
	} else if (keyCode == 13) {
		processEnter();
	}
}

/*******************************************************************************
 * 初始化弹出框列表的位置，大小
 */
function init() {
	$('#auto_div').hide();
	var pos = $('#auto_txt').position();
	var topPosition = pos.top + $('#auto_txt').height() + 7;
	var leftPosition = pos.left;
	$('#auto_div').offset({
		top : topPosition,
		left : leftPosition
	});
	$('#auto_div').width($('#auto_txt').width());
	// $('#auto_div').css('position','absolute');
}

/**
 * 处理Ajax请求
 * 
 * @param data
 */
function processAjaxRequest() {
	if ($('#auto_txt').val() != null && $('#auto_txt').val() != "") {
		var obj = {
			reqWord : $('#auto_txt').val()
		};
		var jsonStr = JSON.stringify(obj);
		$.ajax({
			type : "post", // http请求方法,默认:"post"
			contentType : "application/json;charset=UTF-8",
			url : "selectPointByCon.do", // 发送请求的地址
			data : $('#auto_txt').val(),
			dataType : "json", // 预期服务器返回的数据类型
			success : processAjaxResponse
		});
	}
}

/**
 * 处理Ajax回复
 * 
 * @param data
 *            Ajax请求得到的返回结果为dom文档对象
 */
function processAjaxResponse(data) {

	$('#auto_div').html('').show();
	$.each(data, function(i, item) {
		var word_div = $('<div></div>');
		word_div.attr("data-pointid",item.pointId);
		word_div.html(item.pointName);
		word_div.hover(fnOver, fnOut);
		word_div.click(getAutoText);
		$('#auto_div').append(word_div);
	});
}

/**
 * 处理鼠标滑过
 */
function fnOver() {
	// alert($(this));
	changeToWhite();
	$(this).css('background-color', '#EEEEEE');
	// alert($(this).index());
	highLightIndex = $(this).index();
	// 下面一行注释掉了，百度搜索也没这功能，就是鼠标移动时，跟着改变搜索框的内容
	$('#auto_txt').val($('#auto_div').children().eq(highLightIndex).html());
	$('#hidden').val($('#auto_div').children().eq(highLightIndex).attr("data-pointid"));
}

/**
 * 处理鼠标移除
 */
function fnOut() {
	$(this).css('background-color', 'white');
}

/**
 * 得到自动填充文本
 */
function getAutoText() {
	// 有高亮显示的则选中当前选中当前高亮的文本
	if (highLightIndex != -1) {
		$('#auto_txt').val($(this).html());
		$('#hidden').val($(this).attr("data-pointid"));
		$('#auto_div').html('').hide();
	}
}

/**
 * 处理按下Enter键
 * 
 * @param keyCode
 */
function processEnter() {
	if (highLightIndex != -1) {
		$('auto_txt').val($('#auto_div').children().eq(highLightIndex).html());
		$('#hidden').val($('#auto_div').children().eq(highLightIndex).attr("data-pointid"));
		$('#auto_div').html('').hide();
	}
}

/**
 * 处理按上下键的情况
 */
function processKeyUpAndDown(keyCode) {
	var words = $('#auto_div').children();
	var num = words.length;
	if (num <= 0)
		return;
	changeToWhite();
	highLightIndex = ((keyCode != 38 ? num + 1 : num - 1) + highLightIndex)
			% num;
	words.eq(highLightIndex).css('background-color', '#EEEEEE');
	$('#auto_txt').val(words.eq(highLightIndex).html());
	$('#hidden').val(words.eq(highLightIndex).attr("data-pointid"));
}

/**
 * 如果有高亮的则把高亮变白
 */
function changeToWhite() {
	if (highLightIndex != -1) {
		$('#auto_div').children().eq(highLightIndex).css('background-color',
				'white');
	}
}
function insertBox(type) {
	var localValue = $("#auto_txt").val();
	if (highLightIndex != -1 && value != localValue) {
		value = localValue;
		var timestamp = Date.parse(new Date());
		var str = "";
		if (type == 1)
			str = "<input type=\"radio\" id=\"" + timestamp
					+ "\" name=\"quest_point_Sum\" value=\"" + value
					+ "\"/><label for=\"" + timestamp + "\">" + value
					+ "</label>";
		else
			str = "<input type=\"checkbox\" id=\"" + timestamp
					+ "\" name=\"quest_point_Sum\" value=\"" + value
					+ "\"/><label for=\"" + timestamp + "\">" + value
					+ "</label>";
		$("#checkbox").append(str);
	}
}