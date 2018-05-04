//只能输入数字
jQuery.fn.desNumber = function() {
	this.bind("keypress", function(e) {
		var code = (e.keyCode ? e.keyCode : e.which); // 兼容火狐 IE
		// 火狐下不能使用退格键
		if (e.keyCode == 0x8) {
			return;
		}
		if (this.value.indexOf(".") == -1) {
			return (code >= 48 && code <= 57) || (code == 46);
		} else {
			return code >= 48 && code <= 57
		}
	});
	this.bind("paste", function() {
		return false;
	});
	this.bind("keyup", function() {
		if (this.value.slice(0, 1) == ".") {
			this.value = "";
		}
	});
	this.bind("blur", function() {
		if (this.value.slice(-1) == ".") {
			this.value = this.value.slice(0, this.value.length - 1);
		}
	});
}; 

jQuery.fn.number = function() {
	this.bind("keypress", function(e) {
		var code = (e.keyCode ? e.keyCode : e.which); // 兼容火狐 IE
		// 火狐下不能使用退格键
		if (e.keyCode == 0x8) {
			return;
		}
		return code >= 48 && code <= 57
	});
	this.bind("paste", function() {
		return false;
	});
}; 

//控制选择器的任意改变大小
(function($, h, c) {  
    var a = $([]), e = $.resize = $.extend($.resize, {}), i, k = "setTimeout", j = "resize", d = j  
            + "-special-event", b = "delay", f = "throttleWindow";  
    e[b] = 350;  
    e[f] = true;  
    $.event.special[j] = {  
        setup : function() {  
            if (!e[f] && this[k]) {  
                return false  
            }  
            var l = $(this);  
            a = a.add(l);  
            $.data(this, d, {  
                w : l.width(),  
                h : l.height()  
            });  
            if (a.length === 1) {  
                g()  
            }  
        },  
        teardown : function() {  
            if (!e[f] && this[k]) {  
                return false  
            }  
            var l = $(this);  
            a = a.not(l);  
            l.removeData(d);  
            if (!a.length) {  
                clearTimeout(i)  
            }  
        },  
        add : function(l) {  
            if (!e[f] && this[k]) {  
                return false  
            }  
            var n;  
            function m(s, o, p) {  
                var q = $(this), r = $.data(this, d);  
                r.w = o !== c ? o : q.width();  
                r.h = p !== c ? p : q.height();  
                n.apply(this, arguments)  
            }  
            if ($.isFunction(l)) {  
                n = l;  
                return m  
            } else {  
                n = l.handler;  
                l.handler = m  
            }  
        }  
    };  
    function g() {  
        i = h[k](function() {  
            a.each(function() {  
                var n = $(this), m = n.width(), l = n.height(), o = $  
                        .data(this, d);  
                if (m !== o.w || l !== o.h) {  
                    n.trigger(j, [ o.w = m, o.h = l ])  
                }  
            });  
            g()  
        }, e[b])  
    }  
})(jQuery, this);  