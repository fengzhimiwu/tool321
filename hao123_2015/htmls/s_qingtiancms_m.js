




















var _imgEl = document.getElementById("imgArr").getElementsByTagName("a");
var _imgarr = Math.floor(Math.random() * _imgEl.length);
_imgEl[_imgarr].style.display = "inline";

if(qtcmsdd.add.a=="code"){
	qingtiancms_com.g("imgArr_t").innerHTML="";	
	qingtiancms_com.g("imgArr_t").style.display="";
	qingtiancms_com.g("imgArr_t").className="imgArr_t_ad";
	
}
else{
	var _imgEl = document.getElementById("imgArr_t").getElementsByTagName("a");
	var _imgarr = Math.floor(Math.random() * _imgEl.length);
	_imgEl[_imgarr].style.display = "inline";
}

var Suggest = (function() {
    var h = $("#sf .searchWord"),
    c = $("#suggest"),
    s = $("#topShow"),
    l,
    o = -1,
    b = null,
    n,
    g,
    a = false,
    m = false,
    p = false,
    q = false;
    h.el.onkeydown = function(u) {
        var u = u || window.event;
        if (q) {
            return
        }
        s.hide();
        $(".overArw").removeClass("up");
        switch (u.keyCode) {
        case 38:
            if (p) {
                if (this.value == "") {
                    return
                }
                c.show();
                p = false
            } else {
                o--
            }
            d();
            break;
        case 40:
            if (p) {
                if (this.value == "") {
                    return
                }
                c.show();
                p = false
            } else {
                o++
            }
            d();
            break;
        case 27:
            this.value = l;
            j();
            break;
        case 13:
            cache.set("Handdle_Key", "13");
            j();
            break;
        default:
            break
        }
    };
    h.el.onkeyup = function(u) {
        var u = u || window.event;
        if (q) {
            return
        }
        l = this.value;
        switch (u.keyCode) {
        case 38:
            m = true;
            break;
        case 40:
            m = true;
            break;
        case 8:
            if (this.value == "") {
                j()
            } else {
                r()
            }
            break;
        case 27:
            this.value = l;
            j();
        case 13:
            cache.set("Handdle_Key", "13");
            j();
            break;
        default:
            if (l != "") {
                r()
            }
            break
        }
    };
    h.el.onblur = function() {
        if (!a) {
            j();
            s.hide();
            $(".overArw").removeClass("up")
        }
    };
    function d() {
        if (!g) {
            return
        }
        var u = g.length;
        m = true;
        if (o < 0) {
            o = u - 1
        } else {
            if (o >= u) {
                o = 0
            }
        }
        for (var v = 0,
        u = g.length; v < u; v++) {
            g[v].className = ""
        }
        g[o].className = "hover";
        h.el.value = g[o].innerHTML
    }
    function f() {
        if (typeof(n) != "object" || typeof(n) == "undefined") {
            return
        }
        var u = "<ul>";
        n.forEach(function(x, w, v) {
            if (cache.get("CURRENT_SE_TAB") == "taobao") {
                u += '<li key="' + w + '">' + x[0] + "</li>"
            } else {
                u += '<li key="' + w + '">' + x + "</li>"
            }
        });
        u += "</ul>";
        g = c.el.getElementsByTagName("li");
        c.el.innerHTML = u;
        c.show();
        o = -1;
        p = false;
        e()
    }
    function j() {
        c.hide();
        p = true
    }
    function i() {
        h.el.setAttribute("autocomplete", "on");
        h.el.focus();
        c.hide();
        q = true
    }
    function e() {
        c.el.onmouseover = function(x) {
            var x = x || window.event,
            w = x.target || x.srcElement;
            if (w.tagName.toUpperCase() == "LI") {
                for (var v = 0,
                u = g.length; v < u; v++) {
                    g[v].className = ""
                }
                w.className = "hover";
                o = parseInt(w.getAttribute("key"));
                $(w).on("mouseout",
                function(y) {
                    y.className = ""
                })
            }
            a = true
        };
        c.el.onmouseout = function() {
            a = false
        };
        c.el.onclick = function(w) {
            var w = w || window.event,
            v = w.target || w.srcElement;
            if (v.tagName.toUpperCase() == "LI") {
                h.el.value = v.innerHTML;
                h.el.focus();
                j();
                var u = document.getElementById("searchForm");
                cache.set("Handdle_Key", "S");
                u.onsubmit();
                u.submit()
            }
            if (v.id == "closeSugBtn") {
                i()
            }
        }
    }
    function t() {
        s.el.onmouseover = function(v) {
            var v = v || window.event,
            u = v.target || v.srcElement;
            if (u.tagName.toUpperCase() == "LI") {
                $(u).addClass("hover");
                o = parseInt(u.getAttribute("key"))
            }
            a = true
        };
        s.el.onmouseout = function(v) {
            var v = v || window.event,
            u = v.target || v.srcElement;
            if (u.tagName.toUpperCase() == "LI") {
                $(u).removeClass("hover")
            }
            a = false
        };
        s.el.onclick = function(w) {
            var w = w || window.event,
            v = w.target || w.srcElement;
            if (v.tagName.toUpperCase() == "A") {
                h.el.value = v.innerHTML;
                h.el.focus();
                s.hide();
                $(".overArw").removeClass("up");
                var u = document.getElementById("searchForm");
                cache.set("Handdle_Key", "TS");
                u.onsubmit();
                u.submit()
            }
            if (v.tagName.toUpperCase() == "LI") {
                h.el.value = v.getAttribute("rel");
                h.el.focus();
                s.hide();
                $(".overArw").removeClass("up");
                var u = document.getElementById("searchForm");
                cache.set("Handdle_Key", "TS");
                u.onsubmit();
                u.submit()
            }
        }
    }
    $("#searchForm").el.onsubmit = function() {
        var u = cache.get("CURRENT_SE_TAB") ? cache.get("CURRENT_SE_TAB") : "web";
        KeywordCount({
            type: u,
            word: h.el.value,
            url: window.location.href,
            key: cache.get("Handdle_Key")
        },
        "http://www.tjj.com/click.php");
        if (_hmt) {
            _hmt.push(["_trackEvent", "������", "submit", u, h.el.value])
        }
    };
    $("#search_btn").on("click",
    function() {
        cache.set("Handdle_Key", "B")
    });
    function r() {
        var x = $("head").el;
        var v = cache.get("CURRENT_SE_TAB");
        if (b) {
            if (v == "taobao") {
                b.charset = "utf-8"
            } else {
                b.charset = "gb2312"
            }
        }
        if (!Browser.isIE) {
            if (b) {
                x.removeChild(b)
            }
            b = null
        }
        if (!b) {
            var u = document.createElement("script");
            u.type = "text/javascript";
            if (v == "taobao") {
                u.charset = "utf-8"
            } else {
                u.charset = "gb2312"
            }
            x.insertBefore(u, x.firstChild);
            b = u
        }
        var y = new Date().getTime();
        var w = encodeURIComponent(h.el.value);
        var z = "";
        switch (v) {
        case "taobao":
            z = "http://suggest.taobao.com/sug?code=utf-8&callback=taobaoSU&q=" + w + "&rd=" + y;
            break;
        default:
            z = "http://unionsug.baidu.com/su?wd=" + w + "&p=3&cb=baiduSU&t=" + y
        }
        b.src = z
    }
    window.baiduSU = function(u) {
        if (typeof(u) == "object" && typeof(u.s) != "undefined" && typeof(u.s[0]) != "undefined") {
            n = u.s;
            f()
        } else {
            j()
        }
    };
    window.taobaoSU = function(u) {
        if (typeof(u) == "object" && typeof(u.result) != "undefined" && typeof(u.result[0][0]) != "undefined") {
            n = u.result;
            f()
        } else {
            j()
        }
    }
})();


var kuxun = (function() {
    function EncodeUtf8(s1) {
        var s = escape(s1);
        var sa = s.split("%");
        var retV = "";
        if (sa[0] != "") {
            retV = sa[0]
        }
        for (var i = 1; i < sa.length; i++) {
            if (sa[i].substring(0, 1) == "u") {
                retV += Hex2Utf8(Str2Hex(sa[i].substring(1, 5)))
            } else {
                retV += "%" + sa[i]
            }
        }
        return retV
    }
    window.EncodeUtf8 = EncodeUtf8;
    function Str2Hex(s) {
        var c = "";
        var n;
        var ss = "0123456789ABCDEF";
        var digS = "";
        for (var i = 0; i < s.length; i++) {
            c = s.charAt(i);
            n = ss.indexOf(c);
            digS += Dec2Dig(eval(n))
        }
        return digS
    }
    function Dec2Dig(n1) {
        var s = "";
        var n2 = 0;
        for (var i = 0; i < 4; i++) {
            n2 = Math.pow(2, 3 - i);
            if (n1 >= n2) {
                s += "1";
                n1 = n1 - n2
            } else {
                s += "0"
            }
        }
        return s
    }
    function Dig2Dec(s) {
        var retV = 0;
        if (s.length == 4) {
            for (var i = 0; i < 4; i++) {
                retV += eval(s.charAt(i)) * Math.pow(2, 3 - i)
            }
            return retV
        }
        return - 1
    }
    function Hex2Utf8(s) {
        var retS = "";
        var tempS = "";
        var ss = "";
        if (s.length == 16) {
            tempS = "1110" + s.substring(0, 4);
            tempS += "10" + s.substring(4, 10);
            tempS += "10" + s.substring(10, 16);
            var sss = "0123456789ABCDEF";
            for (var i = 0; i < 3; i++) {
                retS += "%";
                ss = tempS.substring(i * 8, (eval(i) + 1) * 8);
                retS += sss.charAt(Dig2Dec(ss.substring(0, 4)));
                retS += sss.charAt(Dig2Dec(ss.substring(4, 8)))
            }
            return retS
        }
        return ""
    }
    return {
        searchTicket: function() {
            var _q = document.getElementById("jP_startCity").value;
            var _k = document.getElementById("jP_toCity").value;
            var _d = document.getElementById("jp_today").value;
            var _kw = "http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=20&FlightWay=0";
            if (_q == "") {
                alert("�����������!")
            } else {
                _q = EncodeUtf8(EncodeUtf8(_q))
            }
            if (_k == "") {
                alert("�����뵽���!")
            } else {
                _k = EncodeUtf8(EncodeUtf8(_k))
            }
            if (_d == "") {
                alert("�������������!")
            }
            _kw += "&StartCity=" + _q + "&DestCity=" + _k + "&DepartDate=" + _d + "&sid=1250&allianceid=1112";
            if (_q != "" && _k != "" && _d != "") {
                window.open(_kw)
            }
        },
        searchHotel: function() {
            var _q = document.getElementById("ht_city").value;
            var _k = document.getElementById("ht_key").value;
            var _d = document.getElementById("ht_today").value;
            var _kw = "http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=10";
            if (_q != "") {
                _q = EncodeUtf8(EncodeUtf8(_q))
            } else {
                alert("��������ס���У�")
            }
            if (_d == "") {
                alert("��������ס���ڣ�")
            }
            if (_k != "") {
                _k = EncodeUtf8(EncodeUtf8(_k))
            }
            _kw += "&CityName=" + _q + "&CheckInDate=" + _d + "&CheckOutDate=" + _d + "&HotelName=" + _k + "&sid=1250&allianceid=1112";
            if (_q != "" && _d != "") {
                window.open(_kw)
            }
        },
        searchTravel: function() {
            var _q = document.getElementById("daodao_travel_q").value;
            var _k = document.getElementById("daodao_travel_k").value;
            var _kw = "http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=30";
            if (_q == "") {
                alert("����������أ�")
            } else {
                _q = EncodeUtf8(EncodeUtf8(_q))
            }
            if (_k == "") {} else {
                _k = EncodeUtf8(EncodeUtf8(_k))
            }
            _kw += "&StartCity=" + _q + "&SearchValue=" + _k + "&Channel=1&CurrentTab=0&sid=1250&allianceid=1112";
            if (_q != "") {
                window.open(_kw)
            }
        }
    }
})(); 








$("ul.colTitle li a").on("click",
function(b) {
    var a = YLMF.getEvent(),
    c = $(b.parentNode);
    if (!c.hasClass("active")) {
        if (a.preventDefault) {
            a.preventDefault()
        } else {
            window.event.returnValue = false
        }
    }
    return false
});


function sliderTab(d, b, g) {
    function c() {
        $("#" + d + " .comWrap").each(function(m) {
            if ($(m).getStyle("display") == "block") {
                var j = m.id,
                i = $("#" + j + " ." + b + " li");
                var l = null;
				if(j!="difangzhan"){
					i.each(function(o, n) {
						if ($(o).getStyle("display") == "block") {
							if (l != null) {
								return
							}
							l = n - 1;
							if (n <= 0) {
								l = i.size() - 1
							}
						}
					});
					l = l || 0;
					i.hide();
					i.eq(l).show();
					new Animate(i.get(l), "opacity", {
						from: 0,
						to: 1,
						time: 500
					}).start()
				}
            }
        })
    }
    function h() {

        $("#" + d + " .comWrap").each(function(m) {
            if ($(m).getStyle("display") == "block") {
                var j = m.id,
                i = $("#" + j + " ." + b + " li");
                var l = null;
                i.each(function(o, n) {
                    if ($(o).getStyle("display") == "block") {
                        if (l != null) {
                            return
                        }
                        l = n + 1;
                        if (n >= i.size() - 1) {
                            l = 0
                        }
                    }
                });
                l = l || 0;
                i.hide();
                i.eq(l).show();
                new Animate(i.get(l), "opacity", {
                    from: 0,
                    to: 1,
                    time: 500
                }).start()
            }
        })
    }
    var e;
    function a() {
        window.clearInterval(e);
        e = window.setInterval(function() {
            c()
        },
        g || 6000)
    }
    function f() {
        window.clearInterval(e)
    }
    $("#" + d + " ." + b).hover(function() {
        f()
    },
    function() {
        a()
    });
    $("#" + d + " .lft").on("click",
    function() {
        c()
    });
    $("#" + d + " .rgt").on("click",
    function() {
        h()
    });
    window.setTimeout(function() {
        a()
    },
    8000 * Math.random(0, 1))
}
sliderTab("aside-col01-cont", "mslide");
sliderTab("aside-col02-cont", "msColi");
sliderTab("aside-col03-cont", "msColi");
sliderTab("aside-col04-cont", "mslide");



$("#c_shop").on("click",
function() {
    $(".box-shadow").removeClass("box-shadow");
    $(".ecRow").addClass("box-shadow");
    var a = document.documentElement.scrollTop || document.body.scrollTop;
    new Animate(window, "scrollTop", {
        from: a,
        to: 1721,
        time: 500
    }).start()
});
$("#c_rest").on("click",
function() {
    $(".box-shadow").removeClass("box-shadow");
    $(".btmContent").addClass("box-shadow");
    var a = document.documentElement.scrollTop || document.body.scrollTop;
    new Animate(window, "scrollTop", {
        from: a,
        to: 2107,
        time: 500
    }).start()
});
$("#c_home").on("click",
function() {
    $(".box-shadow").removeClass("box-shadow");
    $(".btmlist").addClass("box-shadow");
    var a = document.documentElement.scrollTop || document.body.scrollTop;
    new Animate(window, "scrollTop", {
        from: a,
        to: 1540,
        time: 500
    }).start()
});
//var gotoTop = {
//    id: "#gotop",
//    bottomId: "#c_goBot",
//    wrap: document.getElementById("costom"),
//    timmer: null,
//    fps: 50,
//    startTime: null,
//    duration: 1000,
//    toggleTimer: null,
//    preAnimate: null,
//    clickMe: function() {
//        var a = document.documentElement.scrollTop || document.body.scrollTop;
//        new Animate(window, "scrollTop", {
//            from: a,
//            to: 0,
//            time: 500
//        }).start()
//    },
//    goBottom: function() {
//        var c = 0;
//        var a = 0;
//        var b = 0;
//        if (document.documentElement && document.documentElement.scrollTop) {
//            c = document.documentElement.scrollTop
//        } else {
//            if (document.body) {
//                c = document.body.scrollTop
//            }
//        }
//        if (document.body.clientHeight && document.documentElement.clientHeight) {
//            a = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
//        } else {
//            a = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
//        }
//        b = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
//        new Animate(window, "scrollTop", {
//            from: c,
//            to: b - a,
//            time: 500
//        }).start()
//    },
//    toggleMe: function() {
//        var a = document.documentElement.scrollTop || document.body.scrollTop;
//        if (a > 500) {
//            $("#gotop").show();
//            $("#c_goBot").hide()
//        } else {
//            $("#c_goBot").show();
//            $("#gotop").hide()
//        }
//    },
//    init: function() {
//        $(this.id).on("click",
//        function() {
//            gotoTop.clickMe();
//            return false
//        });
//        $(this.bottomId).on("click",
//        function() {
//            gotoTop.goBottom();
//            return false
//        });
//        gotoTop.toggleMe();
//        $(window).on("scroll",
//        function() {
//            window.clearTimeout(gotoTop.toggleTimer);
//            gotoTop.toggleTimer = window.setTimeout(function() {
//                gotoTop.toggleMe()
//            },
//            200)
//        });
//        $(window).on("resize",
//        function() {
//            window.clearTimeout(gotoTop.toggleTimer);
//            gotoTop.toggleTimer = window.setTimeout(function() {
//                gotoTop.toggleMe()
//            },
//            200)
//        })
//    }
//};


var gotoTop = {
	id: "#gotop",
	bottomId: "#c_goBot",

	wrap: document.getElementById("costom"),
	timmer: null,
	fps: 50,
	startTime: null,
	duration: 1000,
	toggleTimer: null,
	preAnimate: null,
	clickMe: function() {
		var a = document.documentElement.scrollTop || document.body.scrollTop;
		new Animate(window, "scrollTop", {
			from: a,
			to: 0,
			time: 500
		}).start()
	},
	goBottom: function() {
		var c = 0;
		var a = 0;
		var b = 0;
		if (document.documentElement && document.documentElement.scrollTop) {
			c = document.documentElement.scrollTop
		} else {
			if (document.body) {
				c = document.body.scrollTop
			}
		}
		if (document.body.clientHeight && document.documentElement.clientHeight) {
			a = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
		} else {
			a = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
		}
		b = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
		new Animate(window, "scrollTop", {
			from: c,
			to: b - a,
			time: 500
		}).start()
	},
	toggleMe: function() {
		var a = document.documentElement.scrollTop || document.body.scrollTop;
		var b = $(".m-search").getStyle("margin-top");
		if (a >100) {
			$("#gotop").show();
			$("#c_goBot").hide();
			$("#js_mailLogin").hide();
			$("#js_eMailList").hide();
			$("#js_eMail").removeClass("e-mailActived");
			$("#wrap").hasClass("m-fixed",function(g) {
				if (!g) {
					$("#wrap").addClass("m-fixed")
				}
			});
		} else {
			$("#c_goBot").show();
			$("#gotop").hide();
			$("#wrap").removeClass("m-fixed")
		}
	},
	init: function() {
		$(this.id).on("click",
		function() {
			gotoTop.clickMe();
			return false
		});
		$(this.bottomId).on("click",
		function() {
			gotoTop.goBottom();
			return false
		});
		gotoTop.toggleMe();
		$(window).on("scroll",
		function() {
			window.clearTimeout(gotoTop.toggleTimer);
			gotoTop.toggleTimer = window.setTimeout(function() {
				gotoTop.toggleMe()
			},
			200)
		});
		$(window).on("resize",
		function() {
			window.clearTimeout(gotoTop.toggleTimer);
			gotoTop.toggleTimer = window.setTimeout(function() {
				gotoTop.toggleMe()
			},
			200)
		})
	}
};
gotoTop.init();

function lazyload(a) {
    var c = a.get(0).getElementsByTagName("img");
    for (var b = 0; b < c.length; b++) {
        var d = c[b].getAttribute("org");
        if (d) {
            c[b].setAttribute("src", d);
            c[b].removeAttribute("org")
        }
    }
}
$("ul.colTitle li").each(function(a) {
    $(a).hover(function(b) {
        var c = b.getAttribute("rel");
        setTimeout(function() {
            lazyload($("#" + c))
        },
        500);
        $(b).addClass("hover")
    },
    function(b) {
        $(b).removeClass("hover")
    })
});


$("li.mySetting").on("click",
function() {
    lazyload($("#js_skinList li"))
});if (Browser.isIE == "6.0") {
//    $(window).on("load",
//    function() {
//        lazyload($("#js_skinList li"))
//    })
} 




(function() {
    var e = false,
    n = null;
    skinStyleObj = $("#js_skinStyle"),
    oSkinCss = Cookie.get(Config.SkinCookieName) || Config.defaultTheme;
    curSkinValue = oSkinCss;
    _themeChangeLink = $("#themeChange a");
    var j = (function() {
        var p = function() {
            if (typeof($("#js_reOld")) !== "undefined" && typeof($("#js_feedback")) !== "undefined") {
                var q = $("#js_reOld");
                var t = qtcmsdd.t+"public4/rebuild/css/skin/",
                s = $("#js_skinStyle");
                var r = $("#js_reOld a");
                r.on("click",
                function(u) {
                    $(u).hasClass("exp-new",
                    function(w) {
                        if (!w) {
                            Cookie.set("oldLayout", 1);
                            $(u).addClass("exp-new");
                            u.innerHTML = "�ָ�Ĭ��";
                            Cookie.set("skinCss", "classicsBlue");
                            curSkinValue = "classicsBlue";
                            s.el.setAttribute("href", t + "classicsBlue.css?" + Math.round(Math.random() * 10000));
                            $(".box-mySetting .skin-list li").removeClass("actived");
                            $("#js_skinList #js_classicsBlue").addClass("actived");
                            if (Cookie.get("ws")) {
                                $("#classicsWrap").addClass("kpWrap")
                            }
                            i()
                        } else {
                            $("#classicsWrap").removeClass("kpWrap");
                            $(u).removeClass("exp-new");
                            u.innerHTML = "������";
                            Cookie.clear("oldLayout");
                            Cookie.clear("ws");
                            Cookie.set("skinCss", "blue");
                            curSkinValue = "blue";
                            s.el.setAttribute("href", t + "blue.css?" + Math.round(Math.random() * 10000));
                            $("#js_skinList #js_classicsBlue").removeClass("actived");
                            var v = document.getElementById("ws");
                            if (v) {
                                v.parentNode.removeChild(v)
                            }
                            i()
                        }
                    });
                    if (Browser.isIE) {
                        window.location.reload(true)
                    }
                });
                if (Cookie.get("oldLayout")) {
                    r.el.innerHTML = "�ָ�Ĭ��";
                    r.addClass("exp-new")
                } else {
                    r.el.innerHTML = "������";
                    r.removeClass("exp-new")
                }
            }
			
			
			
        };
        return {
            run: p
        }
    })();
    j.run();
    function b(p) {
        curSkinValue = p;
        skinStyleObj.el.setAttribute("href", Config.cssFilePath + p + ".css")
    }
    function g(p) {
        oSkinCss = curSkinValue;
        Cookie.set(Config.SkinCookieName, p)
    }
    function m() {
        Cookie.clear(Config.SkinCookieName)
    }
    function i() {
        _themeLis && _themeLis.each(function(p) {
            if (p.getAttribute("skin") == curSkinValue) {
                $(p).addClass("curTheme")
            } else {
                $(p).removeClass("curTheme")
            }
        })
    }
    function h() {
        if (Animate.canTransition) {
            $("#theme").setStyle("height", "0px")
        } else {
            n && n.stop();
            n = new Animate($("#theme").get(0), "height", {
                from: 210,
                to: 0,
                time: 300
            });
            n.start()
        }
        _themeChangeLink.html("����");
        $("#themeChange").removeClass("themeChangeDown");
        e = false
    }
    function d() {
        if (Animate.canTransition) {
            $("#theme").setStyle("height", "210px")
        } else {
            n && n.stop();
            n = new Animate($("#theme").get(0), "height", {
                from: 0,
                to: 210,
                time: 300
            });
            n.start()
        }
        _themeChangeLink.html("����");
        $("#themeChange").addClass("themeChangeDown");
        e = true
    }
    $("#themeChange").on("click",
    function() {
        if (e) {
            g(curSkinValue);
            h()
        } else {
            d()
        }
    });
    $("#js_simpleSetColor a").on("click",
    function(p) {
        var q = p.getAttribute("skin");
        b(q);
        g(curSkinValue);
        _themeLis && _themeLis.removeClass("curTheme")
    });
    var l = 0,
    a = 900;
    _sliderUl = null,
    _curSliderAni = null,
    _typeLinks = null,
    _themeSlider = null,
    _typeChangeXhr = null,
    _themeLis = null,
    _totalPage = 0,
    _pageNubUl = null,
    _totalPageSpan = null;
    function c() {
        _sliderUl = $("#themeSliderUl");
        var r = _sliderUl.findChild("li");
        _totalPage = Math.ceil(r.length / 6);
        l = 0;
        _themeLis = $("#themeSliderUl li");
        _themeLis.on("click",
        function(s) {
            var t = s.getAttribute("skin");
            _themeLis.removeClass("curTheme");
            $(s).addClass("curTheme");
            b(t)
        });
        _themeLis.each(function(s) {
            $(s).hover(function(t) {
                $(t).addClass("themeLiHover")
            },
            function(t) {
                $(t).removeClass("themeLiHover")
            })
        });
        _totalPageSpan.html("/" + _totalPage + "ҳ");
        var p = "";
        for (var q = 0; q < _totalPage; q++) {
            p += "<li>" + (q + 1) + "</li>"
        }
        _pageNubUl.setStyle("top", "0px").html(p);
        i()
    }
    var o = $("#themeChange").el;
    if (window.addEventListener) {
        o.addEventListener("mouseover", f, false)
    } else {
        o.attachEvent("onmouseover", f)
    }
    function f() {
        if (window.removeEventListener) {
            o.removeEventListener("mouseover", f, false)
        } else {
            o.detachEvent("onmouseover", f)
        }
        Ajax.request(Config.getThemeUrl(), {
            success: function(p) {
				var kk=p.responseText;
				kk=kk.replace(/###/gi,qtcmsdd.t)
                $(".themeWrap").html(kk);
                $(".themeWrap").removeClass("loadingBig");
                _sliderUl = $("#themeSliderUl");
                _typeLinks = $(".themeTop a");
                _themeSlider = $(".themeSlider");
                _pageNubUl = $(".themePagger ul");
                _totalPageSpan = $(".themePagger span.after");
                _typeLinks.on("click",
                function(q) {
                    _typeLinks.removeClass("cur");
                    $(q).addClass("cur");
                    _themeSlider.html("");
                    _themeSlider.addClass("loadingBig");
                    var s = q.getAttribute("alt");
                    if (_typeChangeXhr) {
                        try {
                            _typeChangeXhr.onreadystatechange = null;
                            _typeChangeXhr.abort()
                        } catch(r) {}
                    }
                    _typeChangeXhr = Ajax.request(Config.getThemeTypeUrl(s), {
                        success: function(t) {
							var kk=t.responseText;
							kk=kk.replace(/###/gi,qtcmsdd.t)
                            _themeSlider.html(kk);
                            _themeSlider.removeClass("loadingBig");
                            c()
                        }
                    })
                });
                $("#themeSave").on("click",
                function(q) {
                    g(curSkinValue);
                    h()
                });
                $("#themeCan").on("click",
                function(q) {
                    b(oSkinCss);
                    i();
                    h()
                });
                $("#themeDel").on("click",
                function(q) {
                    b(Config.defaultTheme);
                    i();
                    g(curSkinValue);
                    h()
                });
                $(".themeRight").on("click",
                function() {
                    if (l >= _totalPage - 1) {
                        _curSliderAni && _curSliderAni.stop();
                        _curSliderAni = new Shake(_sliderUl.get(0), "left", {
                            from: parseInt(_sliderUl.getStyle("left"), 0),
                            to: -l * a,
                            time: 800,
                            amplitude: -100
                        });
                        _curSliderAni.start();
                        return
                    }
                    l++;
                    _curSliderAni && _curSliderAni.stop();
                    _curSliderAni = new Animate(_sliderUl.get(0), "left", {
                        from: parseInt(_sliderUl.getStyle("left"), 0),
                        to: -l * a,
                        time: 300
                    });
                    _curSliderAni.start();
                    _pageNubUl.setStyle("top", -l * 24 + "px")
                });
                $(".themeLeft").on("click",
                function() {
                    if (l <= 0) {
                        _curSliderAni && _curSliderAni.stop();
                        _curSliderAni = new Shake(_sliderUl.get(0), "left", {
                            from: parseInt(_sliderUl.getStyle("left"), 0),
                            to: -l * a,
                            time: 800,
                            amplitude: 100
                        });
                        _curSliderAni.start();
                        return
                    }
                    l--;
                    _curSliderAni && _curSliderAni.stop();
                    _curSliderAni = new Animate(_sliderUl.get(0), "left", {
                        from: parseInt(_sliderUl.getStyle("left"), 0),
                        to: -l * a,
                        time: 300
                    });
                    _curSliderAni.start();
                    _pageNubUl.setStyle("top", -l * 24 + "px")
                });
                c()
            },
            failure: function(p) {}
        })
    }
})();






var __$ = function(b) {
    var a = document;
    return a.getElementById(b)
};


var W = document.getElementById("weather");
var Weather = {
    timer: null,
    CityCookieName: "citydata",
    WeatherCookieName: "weather",
    DefaultCity: ["109", "101010100", "101010100", "����", "����"],
    StatIPQueue: [],
    StatGetQueue: [],
    Set: function() {
        W.style.display = "none";
        __$("setCityBox").style.display = "";
        var a = Cookie.get(this.CityCookieName);
        if (a) {
            a = a.split(",")
        } else {
            a = this.DefaultCity
        }
        __$("w_pro").value = a[0];
        this.initCitys(a[0]);
        __$("w_city").value = a[1];
        this.initAreaCitys(a[2])
    },
    ShowStatus: function(f) {
        if (!f) {
            return
        }
        var d = '<ul class="weather"><li><h4 class="city">#{city}</h4><a class="cut" href="javascript:void(0);" onclick="Weather.Set();return false;">[�л�]</a></li><li class="tWrap"><div class="i"><a href="http://www.weather.com.cn/weather/#{cityid}.shtml"><img  onload="pngfix(this)" title="#{img1_title}" src="'+qtcmsdd.t+'public4/rebuild/images/m/#{img1}.png" /></a></div><a href="http://www.weather.com.cn/weather/#{cityid}.shtml" target="_blank" class="t" title=#{jtitle}>�� #{img1_title}<i class="tem">#{today}</i><i class="tem2">#{pollution}</i></a></li><li class="mWrap"><div class="i"><a href="http://www.weather.com.cn/weather/#{cityid}.shtml"><img onload="pngfix(this)" title="#{img2_title}" src="'+qtcmsdd.t+'public4/rebuild/images/m/#{img2}.png" /></a></div><a href="http://www.weather.com.cn/weather/#{cityid}.shtml" target="_blank" class="t" title="#{mtitle}">�� #{img2_title}<i class="tem">#{tomorrow}</i></a></li></ul>';
        var g;
        $(".weather-tip").hide();
        switch (f) {
        case 100:
            g = '�����жϳ��У����Ժ�...&nbsp; <a href="javascript:void(0);" onclick="Weather.Set();return false;" target="_self">[�ֶ�����]</a> <a href="http://www.weather.com.cn/" target="_blank">���ٲ鿴</a>';
            break;
        case 101:
            g = "�жϳ���ʧ�ܣ�Ĭ��Ϊ���������ֶ����á�";
            break;
        case 102:
            g = '���ڻ�ȡ�������ݣ����Ժ�... <a href="http://www.weather.com.cn/" target="_blank">���ٲ鿴</a>';
            break;
        case 404:
            g = '�ܱ�Ǹ�����޸ó����������ݡ�<a href="javascript:void(0);" onclick="Weather.Set();return false;" target="_self">[ѡ����������]</a>';
            break;
        case 500:
            g = '����������򱾵����������<a href="javascript:void(0);" target="_self" onclick="Weather.Init();return false;">[�������]</a>';
            break;
        case 200:
            var c = arguments[1];
            var h = ["��", "һ", "��", "��", "��", "��", "��"],
            b = new Date();
            var e = b.getDay();
            var a = b.getDay() == 6 ? 0 : e + 1;
            g = format(d, {
                cityid: c[3],
                city: c[0],
                today: c[1],
                tomorrow: c[2],
                img1: c[4],
                img2: c[5],
                week1: h[e],
                week2: h[a],
                img1_title: c[6],
                img2_title: c[7],
                pollution: c[8] || "",
				weat:c[9],
				weam:c[10]
            });
            break
        }
        W.innerHTML = g
    },
    Ip2City: function(c) {
		//http://opens.haoyer.com/ip/
		//http://api.114la.com/ip
        this.ShowStatus(100);
        Ylmf.ScriptLoader.Add({
            src: "http://api.114la.com/ip",
            charset: "gb2312"
        });
        var a = this;
        if (typeof b != "undefined") {
            window.clearTimeout(b)
        }
        var b = window.setTimeout(function() {
            Cookie.clear(this.CityCookieName);
            c && c(a.DefaultCity)
        },
        3000);
        window.ILData_callback = function() {
            if (typeof(ILData) != "undefined") {
                if (typeof b != "undefined") {
                    window.clearTimeout(b)
                }
                if (ILData[2] && ILData[3]) {
                    var d = Ylmf.getProId(ILData[2]);
                    var f = Ylmf.getCityId(d, ILData[3]);
                    var e = [d, f, f, ILData[2], ILData[3]];
                    Cookie.set(a.CityCookieName, e);
                    c && c(e)
                } else {
                    a.ShowStatus(101);
                    Cookie.set(a.CityCookieName, a.DefaultCity);
                    c && c(a.DefaultCity)
                }
            }
        }
    },
    Get: function(e) {
        if (!e) {
			if(qtcmsdd.Dc!="")
				e=qtcmsdd.Dc;
			else
				e=Weather.DefaultCity[1]
        }
        var b = e.slice(3, 7);
        var f = this.ShowStatus;
        var d = this;
        f(102);
        if (typeof a != "undefined") {
            window.clearTimeout(a)
        }
        if (!Cookie.get(this.CityCookieName)) {
            var a = window.setTimeout(function() {
                f(500);
                Cookie.clear(this.CityCookieName)
            },
            5000)
        }
        var c = "http://opens.haoyer.com/weather.php?" + e + ".txt";
        if (!Cookie.get(this.WeatherCookieName)) {}
        Ylmf.ScriptLoader.Add({
            src: c.toString(),
            charset: "utf-8"
        });
        window.Ylmf.getWeather = function(i) {
            window.clearTimeout(Weather.timer);
            if (typeof(i) == "object" && typeof(i) != "undefined" && typeof(i.weatherinfo) != "undefined" && i.weatherinfo != false) {
				Weather.yx="2";
				var bb="�������� <span class=\"grade grade3\">��<\/span>";
				var bb_2=i.weatherinfo.pollution;
				var bb_3=bb_2.replace(/<a href=(.*?)>/gi, "");
				bb_3=bb_3.replace(/<\/a>/gi, "");
                var j = [i.weatherinfo.temp1, i.weatherinfo.temp2];
                var g = [i.weatherinfo.city, j[0], j[1], e, i.weatherinfo.img1, i.weatherinfo.img3, i.weatherinfo.weather1, i.weatherinfo.weather2, bb_3, "", ""];
                if (g) {
                    Weather.ShowStatus(200, g);
                    $(".tWrap").hover(function(l) {
                        $(l).addClass("tWrapHover")
                    },
                    function(l) {
                        $(l).removeClass("tWrapHover")
                    });
                    $(".mWrap").hover(function(l) {
                        $(l).addClass("mWrapHover")
                    },
                    function(l) {
                        $(l).removeClass("mWrapHover")
                    });
                    if (i.weatherinfo.pollution && i.weatherinfo.pollution != "") {
                        $("#weather .tWrap .tem").hide()
                    }
                    Weather.timer = window.setTimeout(function() {
                        $("#weather .tem2").hide();
                        $("#weather .tWrap .tem").show()
                    },
                    10000);
                    var h = ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "19", "21", "22", "23", "24", "25"];
					if (i.weatherinfo.tip && i.weatherinfo.tip!="") {
						$(".weather-txt").html(i.weatherinfo.tip);
						$(".weather-tip").show();
						$(".weather-close").on("click",
						function() {
							$(".weather-tip").hide()
						})
					}
                    Cookie.set(d.WeatherCookieName, 1)
                }
            } else {
                if (i.weatherinfo == false) {
                    Weather.ShowStatus(404)
                }
            }
        }
    },
    Init: function() {
        var c = this.CityCookieName;
        var b = this;
        if (Cookie.get(this.CityCookieName)) {
            var a = Cookie.get(this.CityCookieName).split(",");
            if (!a[2]) {
                Cookie.clear(this.CityCookieName);
                b.Init()
            }
            this.Get(a[2])
        } else {
            this.Ip2City(function(d) {
                var e = Cookie.get(b.CityCookieName);
                if (e) {
                    e = e.split(",");
					var p=e[2];
					if(qtcmsdd.Dc!=""){
						p=qtcmsdd.Dc;	
						Cookie.set(b.CityCookieName, p);
					}
                    b.Get(p)
                } else {
                    b.Get(d[2])
                }
            })
        }
    },
    getAreas: function(c, b) {
        var a = c.slice(3, 7);
        Ylmf.ScriptLoader.Add({
            src: "http://opens.haoyer.com/weather/getAreas/"+a+".txt?" + parseInt(Math.random() * 99),
            charset: "utf-8"

        });
        window.Ylmf.getAreaCity = function(d) {
            if (typeof(d) == "object" && typeof(d.result) != "undefined" && typeof(d.result[0][0]) != "undefined") {
				Weather.yx="2";	
                b(d.result)
            }
        }
    },
    initCitys: function(b) {
        if (!b) {
            return
        }
        __$("w_city").innerHTML = "";
        for (var d = 0,
        a = CityArr.length; d < a; ++d) {
            var c = CityArr[d];
            if (c[1] == b) {
                var e = document.createElement("option");
                e.value = c[2];
                e.innerHTML = c[3] + "&nbsp;" + c[0];
                __$("w_city").appendChild(e)
            }
        }
        __$("w_city").selectedIndex = 0
    },
    initAreaCitys: function(b, a) {
        __$("l_city").innerHTML = "";
        this.getAreas(b,
        function(g) {
            for (var e = 0,
            c = g.length; e < c; ++e) {
                var d = g[e];
                var f = document.createElement("option");
                if (d[0] == b) {
                    f.selected = true
                }
                f.value = d[0];
                f.innerHTML = d[2] + "&nbsp;" + d[1];
                __$("l_city").appendChild(f)
            }
            if (a) {
                a()
            }
        })
    },
    cp: function(a) {
        this.initCitys(a);
        __$("w_city").selectedIndex = 0;
        this.cc(__$("w_city").value)
    },
    cc: function(a) {
        this.initAreaCitys(a,
        function() {})
    },
    custom: function() {
        var a = Cookie.get(this.CityCookieName);
        if (a) {
            a = a.split(",")
        } else {
            a = this.DefaultCity
        }
        var b = [__$("w_pro").value, __$("w_city").value, __$("l_city").value ? __$("l_city").value: __$("w_city").value, Ylmf.getSelectValue(__$("w_pro")), Ylmf.getSelectValue(__$("w_city"))];
        if (a[2] != b[2]) {
            this.Get(b[2]);
            Cookie.set(this.CityCookieName, b)
        }
        __$("setCityBox").style.display = "none";
        W.style.display = ""
    },
    autoLoad: function() {
        Cookie.clear(this.CityCookieName);
        Cookie.clear(this.WeatherCookieName);
        this.Init();
        __$("setCityBox").style.display = "none";
        W.style.display = ""
    }
};
Weather.Init();
var CityArr = [["CategoryName", "ParentId", "Id"], ["��������", "0", "1"], ["����", "1", "109"], ["����", "109", "101010100", "B"], ["���", "1", "110"], ["���", "110", "101030100", "T"], ["�ӱ�", "1", "111"], ["ʯ��ׯ", "111", "101090101", "S"], ["����", "111", "101090201", "B"], ["�е���", "111", "101090402", "C"], ["����", "111", "101090701", "C"], ["��ˮ", "111", "101090801", "H"], ["����", "111", "101091001", "H"], ["�ȷ�", "111", "101090601", "L"], ["�ػʵ�", "111", "101091101", "Q"], ["��ɽ", "111", "101090501", "T"], ["��̨", "111", "101090901", "X"], ["�żҿ�", "111", "101090301", "Z"], ["ɽ��", "1", "112"], ["̫ԭ", "112", "101100101", "T"], ["����", "112", "101100501", "C"], ["��ͬ", "112", "101100201", "D"], ["����", "112", "101100401", "J"], ["����", "112", "101100601", "J"], ["�ٷ�", "112", "101100701", "L"], ["����", "112", "101101100", "L"], ["����", "112", "101101001", "X"], ["��Ȫ", "112", "101100301", "Y"], ["�˳�", "112", "101100801", "Y"], ["˷��", "112", "101100901", "Y"], ["���ɹ�", "1", "113"], ["���ͺ���", "113", "101080101", "H"], ["����������", "113", "101081201", "A"], ["��ͷ", "113", "101080201", "B"], ["���", "113", "101080601", "C"], ["������˹", "113", "101080701", "E"], ["���ױ���", "113", "101081000", "H"], ["����", "113", "101080401", "J"], ["�ٺ�", "113", "101080801", "L"], ["ͨ��", "113", "101080501", "T"], ["�ں�", "113", "101080301", "W"], ["��������", "113", "101081101", "W"], ["���ֺ���", "113", "101080901", "X"], ["��������", "0", "2"], ["����", "2", "114"], ["����", "114", "101070101", "S"], ["��ɽ", "114", "101070301", "A"], ["��Ϫ", "114", "101070501", "B"], ["����", "114", "101071201", "C"], ["����", "114", "101070201", "D"], ["����", "114", "101070601", "D"], ["��˳", "114", "101070401", "F"], ["����", "114", "101070901", "F"], ["��«��", "114", "101071401", "H"], ["����", "114", "101070701", "J"], ["����", "114", "101071001", "L"], ["�̽�", "114", "101071301", "P"], ["����", "114", "101071101", "T"], ["Ӫ��", "114", "101070801", "Y"], ["����", "2", "115"], ["����", "115", "101060101", "C"], ["�׳�", "115", "101060601", "B"], ["��ɽ", "115", "101060901", "B"], ["����", "115", "101060201", "J"], ["��Դ", "115", "101060701", "L"], ["��ƽ", "115", "101060401", "S"], ["��ԭ", "115", "101060801", "S"], ["ͨ��", "115", "101060501", "T"], ["�Ӽ�", "115", "101060301", "Y"], ["������", "2", "116"], ["������", "116", "101050101", "H"], ["���˰���", "116", "101050701", "D"], ["����", "116", "101050901", "D"], ["�ں�", "116", "101050601", "H"], ["�׸�", "116", "101051201", "H"], ["��ľ˹", "116", "101050401", "J"], ["����", "116", "101051101", "J"], ["ĵ����", "116", "101050301", "M"], ["�������", "116", "101050201", "Q"], ["��̨��", "116", "101051002", "Q"], ["�绯", "116", "101050501", "S"], ["����", "116", "101050801", "Y"], ["˫Ѽɽ", "116", "101051301", "S"], ["��������", "0", "3"], ["�Ϻ�", "3", "117"], ["�Ϻ�", "117", "101020100", "S"], ["ɽ��", "3", "118"], ["����", "118", "101120101", "J"], ["����", "118", "101121101", "B"], ["����", "118", "101120401", "D"], ["��Ӫ", "118", "101121201", "D"], ["����", "118", "101121001", "H"], ["����", "118", "101120701", "J"], ["����", "118", "101120901", "L"], ["����", "118", "101121601", "L"], ["�ĳ�", "118", "101121701", "L"], ["�ൺ", "118", "101120201", "Q"], ["Ϋ��", "118", "101120601", "W"], ["����", "118", "101121301", "W"], ["��̨", "118", "101120501", "Y"], ["����", "118", "101121501", "R"], ["̩��", "118", "101120801", "T"], ["�Ͳ�", "118", "101120301", "Z"], ["��ׯ", "118", "101121401", "Z"], ["����", "3", "119"], ["�Ϸ�", "119", "101220101", "H"], ["����", "119", "101220601", "A"], ["����", "119", "101220201", "B"], ["����", "119", "101220901", "B"], ["����", "119", "101221101", "C"], ["����", "119", "101221601", "C"], ["����", "119", "101221701", "C"], ["����", "119", "101220801", "F"], ["����", "119", "101220401", "H"], ["��ɽ", "119", "101221001", "H"], ["����", "119", "101221201", "H"], ["����", "119", "101221501", "L"], ["��ɽ", "119", "101220501", "M"], ["����", "119", "101220701", "S"], ["ͭ��", "119", "101221301", "T"], ["�ߺ�", "119", "101220301", "W"], ["����", "119", "101221401", "X"], ["����", "3", "120"], ["�Ͼ�", "120", "101190101", "N"], ["����", "120", "101191101", "C"], ["��ͨ", "120", "101190501", "N"], ["����", "120", "101190901", "H"], ["���Ƹ�", "120", "101191001", "L"], ["����", "120", "101190401", "S"], ["��Ǩ", "120", "101191301", "S"], ["̩��", "120", "101191201", "T"], ["����", "120", "101190201", "W"], ["����", "120", "101190801", "X"], ["����", "120", "101190601", "Y"], ["�γ�", "120", "101190701", "Y"], ["��", "120", "101190301", "Z"], ["�㽭", "3", "121"], ["����", "121", "101210101", "H"], ["����", "121", "101210201", "H"], ["����", "121", "101210301", "J"], ["��", "121", "101210901", "J"], ["��ˮ", "121", "101210801", "L"], ["����", "121", "101210401", "N"], ["����", "121", "101211001", "Q"], ["����", "121", "101210501", "S"], ["̨��", "121", "101210601", "T"], ["����", "121", "101210701", "W"], ["��ɽ", "121", "101211101", "Z"], ["����", "3", "122"], ["�ϲ�", "122", "101240101", "N"], ["����", "122", "101240401", "F"], ["����", "122", "101240701", "G"], ["�Ž�", "122", "101240201", "J"], ["����", "122", "101240601", "J"], ["������", "122", "101240801", "J"], ["Ƽ��", "122", "101240901", "P"], ["����", "122", "101240301", "S"], ["����", "122", "101241001", "X"], ["�˴�", "122", "101240501", "Y"], ["ӥ̶", "122", "101241101", "Y"], ["����", "3", "123"], ["����", "123", "101230101", "F"], ["����", "123", "101230701", "L"], ["����", "123", "101230301", "N"], ["��ƽ", "123", "101230901", "N"], ["����", "123", "101230401", "P"], ["Ȫ��", "123", "101230501", "Q"], ["����", "123", "101230801", "S"], ["����", "123", "101230201", "X"], ["����", "123", "101230601", "Z"], ["���ϵ���", "0", "4"], ["����", "4", "124"], ["֣��", "124", "101180101", "Z"], ["����", "124", "101180201", "A"], ["�ױ�", "124", "101181201", "H"], ["����", "124", "101181101", "J"], ["��Դ", "124", "101181801", "J"], ["����", "124", "101180801", "K"], ["����", "124", "101180901", "L"], ["���", "124", "101181501", "L"], ["����", "124", "101180701", "N"], ["ƽ��ɽ", "124", "101180501", "P"], ["���", "124", "101181301", "P"], ["����", "124", "101181001", "S"], ["����Ͽ", "124", "101181701", "S"], ["����", "124", "101180601", "X"], ["����", "124", "101180301", "X"], ["���", "124", "101180401", "X"], ["�ܿ�", "124", "101181401", "Z"], ["פ���", "124", "101181601", "Z"], ["����", "4", "125"], ["�人", "125", "101200101", "W"], ["����", "125", "101200301", "E"], ["��ʩ", "125", "101201001", "E"], ["�Ƹ�", "125", "101200501", "H"], ["��ʯ", "125", "101200601", "H"], ["����", "125", "101200801", "J"], ["����", "125", "101201401", "J"], ["Ǳ��", "125", "101201701", "Q"], ["ʮ��", "125", "101201101", "S"], ["��ũ��", "125", "101201201", "S"], ["����", "125", "101201301", "S"], ["����", "125", "101201501", "T"], ["�差", "125", "101200201", "X"], ["Т��", "125", "101200401", "X"], ["����", "125", "101200701", "X"], ["����", "125", "101201601", "X"], ["�˲�", "125", "101200901", "Y"], ["����", "4", "126"], ["��ɳ", "126", "101250101", "C"], ["����", "126", "101250501", "C"], ["����", "126", "101250601", "C"], ["����", "126", "101250401", "H"], ["����", "126", "101251201", "H"], ["����", "126", "101251501", "J"], ["¦��", "126", "101250801", "L"], ["ǭ��", "126", "101251301", "Q"], ["����", "126", "101250901", "S"], ["��̶", "126", "101250201", "X"], ["����", "126", "101250701", "Y"], ["����", "126", "101251001", "Y"], ["����", "126", "101251401", "Y"], ["����", "126", "101250301", "Z"], ["�żҽ�", "126", "101251101", "Z"], ["�㶫", "4", "127"], ["����", "127", "101280101", "G"], ["����", "127", "101281501", "C"], ["��ݸ", "127", "101281601", "D"], ["��ɽ", "127", "101280800", "F"], ["����", "127", "101280301", "H"], ["��Դ", "127", "101281201", "H"], ["����", "127", "101281101", "J"], ["����", "127", "101281901", "J"], ["÷��", "127", "101280401", "M"], ["ï��", "127", "101282001", "M"], ["��Զ", "127", "101281301", "Q"], ["�ع�", "127", "101280201", "S"], ["��ͷ", "127", "101280501", "S"], ["����", "127", "101280601", "S"], ["��β", "127", "101282101", "S"], ["�Ƹ�", "127", "101281401", "Y"], ["����", "127", "101281801", "Y"], ["�麣", "127", "101280701", "Z"], ["����", "127", "101280901", "Z"], ["տ��", "127", "101281001", "Z"], ["��ɽ", "127", "101281701", "Z"], ["����", "4", "128"], ["����", "128", "101300101", "N"], ["����", "128", "101301301", "B"], ["��ɫ", "128", "101301001", "B"], ["����", "128", "101300201", "C"], ["���Ǹ�", "128", "101301401", "F"], ["����", "128", "101300501", "G"], ["���", "128", "101300801", "G"], ["����", "128", "101300701", "H"], ["�ӳ�", "128", "101301201", "H"], ["����", "128", "101300301", "L"], ["����", "128", "101300401", "L"], ["����", "128", "101301101", "Q"], ["����", "128", "101300601", "W"], ["����", "128", "101300901", "Y"], ["����", "4", "129"], ["����", "129", "101310101", "H"], ["��ɳ", "129", "101310907", "B"], ["��ͤ", "129", "101311614", "B"], ["����", "129", "101310604", "C"], ["����", "129", "101310806", "C"], ["����", "129", "101310402", "D"], ["����", "129", "101310705", "D"], ["����", "129", "101311109", "D"], ["�ٸ�", "129", "101310503", "L"], ["��ˮ", "129", "101311816", "L"], ["�ֶ�", "129", "101312321", "L"], ["��ɽ", "129", "101310102", "Q"], ["����", "129", "101310208", "Q"], ["��", "129", "101311311", "Q"], ["����", "129", "101311513", "Q"], ["��ɳ��", "129", "101312220", "N"], ["����", "129", "101310301", "S"], ["ɺ����", "129", "101312018", "S"], ["�Ͳ�", "129", "101311210", "T"], ["ͨʲ", "129", "101312422", "T"], ["�Ĳ�", "129", "101311412", "W"], ["����", "129", "101311715", "W"], ["��ɳ", "129", "101311917", "X"], ["����", "129", "101312119", "Y"], ["��������", "0", "5"], ["����", "5", "130"], ["����", "130", "101110101", "X"], ["����", "130", "101110701", "A"], ["����", "130", "101110901", "B"], ["����", "130", "101110801", "H"], ["����", "130", "101110601", "S"], ["ͭ��", "130", "101111001", "T"], ["μ��", "130", "101110501", "W"], ["����", "130", "101110200", "X"], ["�Ӱ�", "130", "101110300", "Y"], ["����", "130", "101110401", "Y"], ["����", "5", "131"], ["����", "131", "101160101", "L"], ["����", "131", "101161301", "B"], ["����", "131", "101160201", "D"], ["����", "131", "101161201", "H"], ["���", "131", "101160601", "J"], ["��Ȫ", "131", "101160801", "J"], ["����", "131", "101161101", "L"], ["ƽ��", "131", "101160301", "P"], ["����", "131", "101160401", "Q"], ["��ˮ", "131", "101160901", "T"], ["����", "131", "101160501", "W"], ["�䶼", "131", "101161001", "W"], ["��Ҵ", "131", "101160701", "Z"], ["����", "5", "132"], ["����", "132", "101170101", "Y"], ["��ԭ", "132", "101170401", "G"], ["ʯ��ɽ", "132", "101170201", "S"], ["����", "132", "101170301", "W"], ["����", "132", "101170501", "Z"], ["�ຣ", "5", "133"], ["����", "133", "101150101", "X"], ["����", "133", "101150501", "G"], ["����", "133", "101150701", "H"], ["����", "133", "101150801", "H"], ["����", "133", "101150201", "H"], ["����", "133", "101150301", "H"], ["����", "133", "101150401", "H"], ["����", "133", "101150601", "Y"], ["�½�", "5", "134"], ["��³ľ��", "134", "101130101", "W"], ["����̩", "134", "101131401", "A"], ["��ͼʲ", "134", "101131501", "A"], ["������", "134", "101130801", "A"], ["������", "134", "101130701", "A"], ["����", "134", "1011301601", "B"], ["����", "134", "101130401", "C"], ["����", "134", "101131201", "H"], ["����", "134", "101131301", "H"], ["��������", "134", "101130201", "K"], ["��ʲ", "134", "101130901", "K"], ["�����", "134", "101130601", "K"], ["ʯ����", "134", "101130301", "S"], ["��³��", "134", "101130501", "T"], ["����", "134", "101131101", "T"], ["����", "134", "101131001", "Y"], ["���ϵ���", "0", "6"], ["����", "6", "135"], ["����", "135", "101040100", "C"], ["�Ĵ�", "6", "136"], ["�ɶ�", "136", "101270101", "C"], ["����", "136", "101271901", "A"], ["����", "136", "101270901", "B"], ["����", "136", "101272001", "D"], ["����", "136", "101270601", "D"], ["��Ԫ", "136", "101272101", "G"], ["����", "136", "101271801", "G"], ["����", "136", "101271001", "L"], ["��ɽ", "136", "101271401", "L"], ["��ɽ", "136", "101271601", "L"], ["üɽ", "136", "101271501", "M"], ["����", "136", "101270401", "M"], ["�ϳ�", "136", "101270501", "N"], ["�ڽ�", "136", "101271201", "N"], ["��֦��", "136", "101270201", "P"], ["����", "136", "101270701", "S"], ["�㰲", "136", "101270801", "G"], ["�Ű�", "136", "101271701", "Y"], ["�˱�", "136", "101271101", "Y"], ["����", "136", "101271301", "Z"], ["�Թ�", "136", "101270301", "Z"], ["����", "6", "137"], ["����", "137", "101260101", "G"], ["��˳", "137", "101260301", "A"], ["�Ͻ�", "137", "101260701", "B"], ["����", "137", "101260401", "D"], ["����", "137", "101260501", "K"], ["����ˮ", "137", "101260801", "L"], ["ͭ��", "137", "101260601", "T"], ["����", "137", "101260201", "Z"], ["ǭ��", "137", "101260901", "Q"], ["����", "6", "138"], ["����", "138", "101290101", "K"], ["��ɽ", "138", "101290501", "B"], ["����", "138", "101290801", "C"], ["����", "138", "101290201", "D"], ["�º�", "138", "101291501", "D"], ["���", "138", "101290301", "H"], ["����", "138", "101291601", "J"], ["�ٲ�", "138", "101291101", "L"], ["����", "138", "101291401", "L"], ["ŭ��", "138", "101291201", "N"], ["����", "138", "101290401", "Q"], ["˼é", "138", "101290901", "S"], ["��ɽ", "138", "101290601", "W"], ["��Ϫ", "138", "101290701", "Y"], ["��ͨ", "138", "101291001", "Z"], ["�е�", "138", "101291301", "Z"], ["����", "6", "139"], ["����", "139", "101140101", "L"], ["����", "139", "101140701", "A"], ["����", "139", "101140501", "C"], ["��֥", "139", "101140401", "L"], ["����", "139", "101140601", "N"], ["�տ���", "139", "101140201", "R"], ["ɽ��", "139", "101140301", "S"], ["�۰�̨", "0", "7"], ["���", "7", "140"], ["���", "140", "101320101", "X"], ["����", "7", "141"], ["����", "141", "101330101", "A"], ["̨��", "7", "142"], ["̨����", "142", "101340101", "T"], ["����", "142", "101340201", "G"], ["����", "142", "101341001", "H"], ["����", "142", "101340901", "J"], ["��", "142", "101340801", "M"], ["�����", "142", "101341201", "P"], ["̨��", "142", "101340301", "T"], ["̨��", "142", "101340401", "T"], ["��԰", "142", "101340501", "T"], ["̨��", "142", "101341101", "T"], ["������", "142", "101340601", "X"], ["����", "142", "101340701", "Y"]];

function User_login_f(){
	window.location.reload();
}