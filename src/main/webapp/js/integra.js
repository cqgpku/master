$.toast = function(msg , time){
	var _left = ($(document.body).width()-270)/2;
	var _height = $(window).height()*0.3;
	var _tar = $('<div class="dialog">'+msg+'</div>').appendTo($(document.body)).css({left: _left, bottom:_height});
	if(time == undefined){time = 1000;}
	setTimeout(function(){
	  $.close_toast(_tar);
	}, time);
};
$.close_toast = function($tar){
	$($tar).remove();
};
var wait=60;
function time(o) {
    if (wait == 0) {
    	$(o).removeClass('un');  
        $(o).text("重新获取");
        wait = 60;
    } else {
    	$(o).addClass('un');
        $(o).text(wait+"秒");
        wait--;
        setTimeout(function() {
            time(o)
        },1000);
    }
}
;(function(){
	$('.btn_get').bind('click',function(){
		var phone_num = $('.phone_num input').val();
		if(wait != 60){
			$.toast('请在'+wait+'秒后重新获取');
			return false;
		};
		if( !(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone_num)) ){
			$.toast("请输入正确的手机号",1500);
			return false;
		};
		time(this);
		$.post(rooturl + "/getcode" , {phone:phone_num} , function(resp){
			if("false" == (resp.toString())){
				$.toast('验证码获取失败！');
			}else{
				$.toast('验证码获取成功，请保持手机畅通！' , 2000);
			}
		})
	});
	$('#regist_phone').keyup(function(){
		var phone_val = $(this).val();
		if(!phone_val || !(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone_val))){
			return false;
		}
		$.post(rooturl+"/isexisted" , {phone : phone_val} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			if(resp.code == 0){
				$('.ctsh').hide();
				$('.btn_refist').removeClass('btn_un').text('立即注册');
				return ;
			}else{
				$('.ctsh').show();
				$('.btn_refist').addClass('btn_un').text('请更换手机号');
			}
		});
	});
	$('.btn_refist').bind('click',function(){
		if($(this).hasClass('btn_un')){
			return false;
		}
		var phone_num = $('.phone_num input').val();
		var password = $('.password input').val();
		var password_again = $('.password_qr input').val();
		var nickname = $('.nickname input').val();
		var tjr = $('.recom input').val();
		var code = $('.code .code_num input').val();
		if( !(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone_num)) ){
			$.toast("请输入正确的手机号",1500);
			return false;
		};
		if( password == "" || !(/^.{8,18}$/.test(password))){
			$.toast("请输入8-18位登录密码",2000);
			return false;
		};
		if( password != password_again ){
			$.toast("请确认两次输入的密码是否一致",2500);
			return false;
		};
//		if( !nickname || nickname < 2 || nickname > 8 ){
//			$.toast("请设置2到8位昵称",1500);
//			return false;
//		}
		if( !code ){
			$.toast("请填写您获取到的验证码",2500);
			return false;
		}
		var post_value = {
				"phone" : phone_num,
				"pwd" : password,
				"pwdt" : password_again,
				"code" : code,
				"nickn" : phone_num,
				"invit" : tjr
		}
		$(this).addClass('btn_un').text("注册中。。。");
		$.post(rooturl + "/register" , post_value , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			$.toast(resp.mess , 2000);
			if(resp.code == 0){
				setTimeout(function(){
					$('.btn_refist').text("注册成功");
					window.location.href=rooturl+"/login/page";
				},1000);
			}
		});
	})
	
	$('.btn_login').bind('click',function(){
		var phone_num = $('.phone_num input').val();
		var password = $('.password input').val();
		if( !(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone_num)) ){
			$.toast("请输入正确的手机号",1500);
			return false;
		};
		if( password == "" || !(/^.{8,18}$/.test(password))){
			$.toast("请检查您的登录密码是否正确",1500);
			return false;
		};
		$.post(rooturl+"/login" , {"nop" : phone_num , "pwd" : password} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			$.toast(resp.mess , 2000);
			if(resp.code == 0){
				setTimeout(function(){
					window.location.reload();
				},1000);
			}
		});
	})
	$('.btn_logout').bind('click',function(){
		
		$.post(rooturl+"/logout" , {} , function(resp){
			window.location.reload();
		});
	})
	
	$('.goto_regist').bind('click',function(){
		window.location.replace(rooturl+"/register/page");
	});
	$('.xybar').bind('click',function(){
		window.location.href = rooturl + "/yhxy";
	});
})();