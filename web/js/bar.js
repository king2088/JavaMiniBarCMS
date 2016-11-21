/**
 * Created by Mr.Tao on 2016/6/30.
 */
$(function () {
    setSlip();

    $('.container figure img').mouseenter(function () {
        $(this).animate({
            opacity:1
        },300);
    });
    $('.container figure img').mouseleave(function () {
        $(this).stop().animate({
            opacity:0.5
        },300);
    });
    //header区域border-bottom颜色的变化，当发现a链接有.active则显示，否则为默认颜色
    //alert($('.nav li a').hasClass("active"));
    if($('.nav li a').hasClass("active") ==true){
        $('#header').css('border-bottom','2px brown solid');
    }

    //newslist页面.container .list li背景颜色
    $('.container .list li:odd').css('background','#EEE');
    $('.container .list li').first().css('marginTop','10px');
    
    $('.container .list li').hover(function () {
        $(this).addClass('c_hover');
    },function () {
        $(this).removeClass('c_hover');
    });
    //由于字体大小不一，因此需要获得li的高度，并且将lineheight设置为li的高度，已达到字体垂直居中
    var li_element = $('.container .list li');
    var li_height = li_element.height()+'px';
    li_element.css('lineHeight',li_height);

    //文章内容字体大小变换
    $('#font-mx').click(function () {
        $('.container .content').css('fontSize','16px');
    });
    $('#font-lx').click(function () {
        $('.container .content').css('fontSize','14px');
    });
    $('#font-sx').click(function () {
        $('.container .content').css('fontSize','12px');
    });



    //弹出登陆框
    $('.login li.login_windows').click(function () {
        $('#login').css({
            top:'50%',
            left:'50%',
            margin:'-'+($('#login').height()/2 +'px 0 0 -'+$('#login').width()/2)+'px',
            zIndex:999
        }).slideDown(300);
        $('body').css({overflow:"hidden"});
        $('#login_bg').css({
            display:'block',
            width:$(window).width(),
            height:$(document).height(),
            zIndex:998
        }).slideDown(300);
    });
    $('#login .close').click(function () {
        $('#login').hide(200);
        $('#login_bg').hide();
        $('body').css({overflow:"scroll"});
    });
    //用户中心下滑菜单
    $('#user_center').hover(function () {
        $('ul.sub').slideDown(600);
    },function () {
        $('ul.sub').slideUp(600);
    });


    //早上好好，下午好代码
    now = new Date(),hour = now.getHours();
    if(hour < 6){$('#user_login').append("\u51cc\u6668\u597d\uff01");}
    else if (hour < 9){$('#user_login').append("\u65e9\u4e0a\u597d\uff01");}
    else if (hour < 12){$('#user_login').append("\u4e0a\u5348\u597d\uff01");}
    else if (hour < 14){$('#user_login').append("\u4e2d\u5348\u597d\uff01");}
    else if (hour < 17){$('#user_login').append("\u4e0b\u5348\u597d\uff01");}
    else if (hour < 19){$('#user_login').append("\u508d\u665a\u597d\uff01");}
    else if (hour < 22){$('#user_login').append("\u665a\u4e0a\u597d\uff01");}
    else {$('#user_login').append("\u591c\u91cc\u597d\uff01");}

	//用户登录ajax查询用户名是否存在或者为空
	$('input[name=username]').blur(function(){
		$.ajax({
			type:'GET',
			url:getRootpath()+'/LoginUser.Tao',
			dataType:'html',
			data:'username='+encodeURI(encodeURI($(this).val())),
			beforeSend:function(XMLHttpRequest)
			{
				$('#Ajax_Name').html('<img src="'+getRootpath()+'/images/loading.gif">');
				//Pause(this,100000);
			},
			success:function (response,status,xhr) {
				$('#Ajax_Name').html(response);
			}
		});
	//alert($(this).val());
	});

    //自动读取用户名密码
	if ($.cookie('MNBUser') == 'true') {
		if(MnbU!='' || MnbP!='' || MnbU.length>0 || MnbP.length>0){
			//$('input[name=ck_MNBUser]').attr('checked', true);
			//自动登录无需再次选中checkbox，如果选中了，那么每次登录都会延长7天时间，如果用户天天登录，那么这个cookie就一直存在下去
			var MnbU=$.cookie('__MNB_mz');
			var MnbP=base64decode(base64decode(base64decode($.cookie('__MNB'))));
			$('input[name=username]').val(MnbU);
			$('input[name=password]').val(MnbP);
			//判断cookie值是否为空，并且li.login_windows存在才执行模拟点击事件
			if($('li').hasClass('login_windows')){
				$('input[name=Login_submit]').trigger("click");
			}
		}
    }
	
	
	$('input[name=Login_submit]').click(function(){
		SaveCookie();
	});
});


    //导航条滑动效果
    var setSlip = function(){
    var slip = $('#navslip');
    var a = $('.nav li a:first');
        //初始化滑块
        slip.css({
            'width':a.width()+10,
            'left' :parseInt(a.position().left) + 5 +'px',
            'display':'none'
        });
        $('.nav li a').mouseenter(function(){
            //显示滑块
            if(slip.css('display') == 'none'){
                slip.show();
            };
            //移动滑块
            slip.stop().animate({
                width: $(this).width()+10,
                left:  parseInt($(this).position().left) + 5 +'px'
            },300);
        });
    };
    //幻灯片
    if($('div').hasClass('module')) {
        var slideshow = $('#Slideshow').glide({
            type: 'slideshow',
            startAt: 2
        });
    }
	//JQ获得当前目录
	function getRootpath(){
        var strFullPath=window.document.location.href; 
        var strPath=window.document.location.pathname; 
        var pos=strFullPath.indexOf(strPath); 
        var prePath=strFullPath.substring(0,pos); 
        var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1); 
        return(prePath+postPath); 
    }
    //cookie记住用户名密码
    function SaveCookie() {	
        if ($('input[name=ck_MNBUser]').is(':checked')) {
          var str_name = $('input[name=username]').val();
          var str_pswd = $('input[name=password]').val();
          $.cookie('MNBUser', 'true', { expires: 7 }); //存储一个带7天期限的cookie
          $.cookie('__MNB_mz', str_name, { expires: 7 });
          $.cookie('__MNB', base64encode(base64encode(base64encode(str_pswd))), { expires: 7 });
        }
        else {
          $.cookie('MNBUser', 'false', { expire: -1 });
          $.cookie('__MNB_mz', '', { expires: -1 });
          $.cookie('__MNB', '', { expires: -1 });
        }
    }