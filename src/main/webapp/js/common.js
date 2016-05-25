//数据序列化
(function($) {
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
				o[this.name] = o[this.name].join(",");
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
})(jQuery);
//日期格式化
Date.prototype.format = function (format) {  
    var o = {  
        "M+": this.getMonth() + 1, // month  
        "d+": this.getDate(), // day  
        "h+": this.getHours(), // hour  
        "m+": this.getMinutes(), // minute  
        "s+": this.getSeconds(), // second  
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S": this.getMilliseconds()  
        // millisecond  
    }  
    if (/(y+)/.test(format))  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
            .substr(4 - RegExp.$1.length));  
    for (var k in o)  
        if (new RegExp("(" + k + ")").test(format))  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
    return format;  
}
function formatDatebox(value,parser) {  
    /* if (value == null || value == '') {  
        return '1970-01-01 08:00:00';  
    }  */ 
    var dt;  
    if (value instanceof Date) {  
        dt = value;  
    } else {  
        dt = new Date(value);  
    }  
    return dt.format(parser);
}
function show(text,timeout) {
	$.messager.show({
		title : '提示',
		msg : text,
		timeout : timeout,
		width : 320,
		height : 160,
		showType : 'show',
		style : {
			right : '',
			bottom : ''
		},
	});
}
function refreshAfterCloseShow(text,timeout) {
	$.messager.show({
		title : '提示',
		msg : text,
		timeout : timeout,
		width : 320,
		height : 160,
		showType : 'show',
		style : {
			right : '',
			bottom : ''
		},
		onClose : function(){
			location.reload();
		}
	});
}