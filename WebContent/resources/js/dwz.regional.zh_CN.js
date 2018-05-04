/**
 * @author 张慧华 z@j-ui.com
 */
(function($){
	// jQuery validate
	if ($.validator) {
		$.extend($.validator.messages, {
			required: "这是必填字段",
			remote: "请修正此字段",
			email: "请输入有效的电子邮件地址",
			url: "请输入有效的网址",
			date: "请输入有效的日期",
			dateISO: "请输入有效的日期 (YYYY-MM-DD)",
			number: "请输入有效的数字",
			digits: "只能输入整数",
			creditcard: "请输入有效的信用卡号码",
			equalTo: "你的输入不相同",
			extension: "请输入有效的后缀",
			maxlength: $.validator.format("最多可以输入 {0} 个字符"),
			minlength: $.validator.format("最少要输入 {0} 个字符"),
			rangelength: $.validator.format("请输入长度在 {0} 到 {1} 之间的字符串"),
			range: $.validator.format("请输入范围在 {0} 到 {1} 之间的数值"),
			max: $.validator.format("请输入不大于 {0} 的数值"),
			min: $.validator.format("请输入不小于 {0} 的数值"),
			
			alphanumeric: "字母、数字、下划线",
			lettersonly: "必须是字母",
			phone: "数字、空格、括号"
			
		});
	}
	
//	$.fn.datepicker.dates['zh-CN'] = {
//		days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
//		daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
//		daysMin:  ["日", "一", "二", "三", "四", "五", "六"],
//		months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
//		monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
//		today: "今日",
//		clear: "清除",
//		format: "yyyy年mm月dd日",
//		titleFormat: "yyyy年mm月",
//		weekStart: 1
//	}
	
	
})(jQuery);