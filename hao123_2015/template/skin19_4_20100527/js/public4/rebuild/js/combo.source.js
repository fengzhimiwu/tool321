if(typeof($('#chrome')[0]) != 'undefined'){
	var Sys = {};
	var ua = navigator.userAgent.toLowerCase();
	window.ActiveXObject ? Sys.ie = ua.match(/msie ([\d.]+)/)[1] :
    document.getBoxObjectFor ? Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1] :
    window.MessageEvent && !document.getBoxObjectFor ? Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1] :
    window.opera ? Sys.opera = ua.match(/opera.([\d.]+)/)[1] :
    window.openDatabase ? Sys.safari = ua.match(/version\/([\d.]+)/)[1] : 0;
	var host =  window.location.href;
	for(v in Sys){
		window.location.href = host + '#'+v;
		$("#"+v).find(".parConts").show().parent().find("h3").addClass("active");
	}
};

$(document).ready(function(){
	var sConfig = {
		baidu: {
			action: "http://www.baidu.com/s",
			name: "wd",
			params:{
				ie:'gbk'
			}
		},
		sogou: {
			action: "http://www.sogou.com/web",
			name: "query",
			params:{
				pid:qtcmsdd.sogou
			}
		}
	};
    var ram = search_name.length;
    var ramdSear = search_name[parseInt(Math.random() * ram)];
    $("#innerTxt").val(ramdSear).focus(function(){
    	$(this).val('');
    });
	//����ղ�
	function AddFavorite(url,title){
	    try{
	        window.external.addFavorite(url, title);
	    }
	    catch(e){
	        try{
	            window.sidebar.addPanel(title, url, "");
	        }
	        catch(e){
	            alert("�����������֧���ղع��ܣ���ʹ��Ctrl+D�������");
	        }
	    }
	};
	$("#collet").click(function(){
		AddFavorite(qtcmsdd.wu,qtcmsdd.wn); return false;
	});
	var categorys = false;
	$(".categorys").bind({
		mouseover:function(){
			categorys = true;
		},
		mouseout:function(){
			categorys = false;
		}
	});
	$("a.cates").click(function(){
		$(".categorys").slideToggle();
		$(this).toggleClass('active');
	}).hover(function(){
		categorys = true;
	},function(){
		categorys = false;
	});
	$(".comRowGuid dl").hover(
		function(){
			$(this).addClass('hover');
		},
		function(){
			$(this).removeClass('hover');
		}
	);
	$(".blk-show").find("h3").hover(function(){
		$(this).addClass('hover');
	},function(){
		$(this).removeClass('hover');
	}).click(function(){
		// $(".blk-show h3").removeClass("active");
		// $(".parConts").hide();
		$(this).toggleClass('active').next().toggle();
	})
	$(".searcha span").click(function(){
		$(this).next("ul").toggle();
	});
	var searcha = false;
	$(".searcha").bind({
		mouseover:function(){
			searcha = true;
		},
		mouseout:function(){
			searcha = false;
		}
	});
	$(document).click(function(){
		if(!searcha) $(".searcha ul").hide();
		if(!categorys){
			$(".categorys").slideUp();
			$("a.cates").removeClass('active');
		}
	});
	$(".searcha input").bind({
		focus:function(){
			if($(this).val() == '�����������ؼ���') $(this).val('');
			$(".searcha ul").hide();
		},
		blur:function(){
			if($(this).val() == '') $(this).val('�����������ؼ���');
		}
	});
	$(".searcha ul li").click(function(){
		var relue = $(this).attr("rel");
		var relTxt = $(this).text();
		var sArry = sConfig[relue];
		var params = sArry.params;
		var input = '';
		for (v in params){
			$(params).each(function (i,items){
				input += '<input type="hidden" name="'+v+'" value="'+params[v]+'" />';
			});
		};
		//console.log(input)
		$(".searcha span").html(relTxt+'<i />');
		$(".searcha ul").hide();
		$("#innerTxt").attr("name",sArry.name);
		$(".searcha").find("input[type='hidden']").remove();
		$("#searForm").attr("action",sArry.action).append(input);
	})

	//�ص�����
	var gotoTop = {
		fixed: "#costom",
		id: "#gotop",
		clickMe : function(){
			$('html,body').animate({scrollTop : '0px'},{ duration:500});
		},
		toggleMe : function() {
			if($(window).scrollTop() == 0) {
				$(this.fixed).stop().animate({'opacity': 0}, "slow");
			} else {
				$(this.fixed).stop().animate({'opacity': 1}, "slow");
			}
		},
		init : function() {
			$(this.fixed).css('opacity', 0);
			$(this.id).click(function(){
				gotoTop.clickMe();
				return false;
			});
			$(window).bind('scroll resize', function(){
				gotoTop.toggleMe();
			});
		}
	};
	gotoTop.init();
});