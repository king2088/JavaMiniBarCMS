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
    })
    $('#font-sx').click(function () {
        $('.container .content').css('fontSize','12px');
    })



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
    now = new Date(),hour = now.getHours()
    if(hour < 6){$('#user_login').append("凌晨好！")}
    else if (hour < 9){$('#user_login').append("早上好！")}
    else if (hour < 12){$('#user_login').append("上午好！")}
    else if (hour < 14){$('#user_login').append("中午好！")}
    else if (hour < 17){$('#user_login').append("下午好！")}
    else if (hour < 19){$('#user_login').append("傍晚好！")}
    else if (hour < 22){$('#user_login').append("晚上好！")}
    else {$('#user_login').append("夜里好！")}

	//用户登录ajax查询用户名是否存在或者为空
	$('input[name=username]').blur(function(){
		$.ajax({
			type:'GET',
			url:'http://localhost:8080/bar/LoginUser.Tao',
			dataType:'html',
			data:'username='+$(this).val(),
			beforeSend:function(XMLHttpRequest)
			{
				$('#Ajax_Name').text('正在查询');
				//Pause(this,100000);
			},
			success:function (response,status,xhr) {
				$('#Ajax_Name').html(response);
			}
		});
	//alert($(this).val());
	});
	//7天自动登录
	if ($.cookie("rmbUser") == "true") {
    $("#ck_rmbUser").attr("checked", true);
    $("#txt_username").val($.cookie("username"));
    $("#txt_password").val($.cookie("password"));
    }
  });
 
  //记住用户名密码
  function Save() {
    if ($("#ck_rmbUser").attr("checked")) {
      var str_username = $("#txt_username").val();
      var str_password = $("#txt_password").val();
      $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
      $.cookie("username", str_username, { expires: 7 });
      $.cookie("password", str_password, { expires: 7 });
    }
    else {
      $.cookie("rmbUser", "false", { expire: -1 });
      $.cookie("username", "", { expires: -1 });
      $.cookie("password", "", { expires: -1 });
    }
    

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