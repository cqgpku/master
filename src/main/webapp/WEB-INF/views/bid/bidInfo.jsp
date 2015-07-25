<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=0.5,maximum-scale=1.0,minimum-scale=0.5,user-scalable=0,width=device-width,maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<title>标的详情</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		
		<style type="text/css">
.divcss5_list_title{background:#eeeeee; border:1px solid #cccccc; padding:1em;}
.divcss5_list_content{padding:1em;}
#tinybox{position:absolute; display:none; padding:10px; background:#ffffff url(image/preload.gif) no-repeat 50% 50%; border:10px solid #e3e3e3; z-index:2000;}
#tinymask{position:absolute; display:none; top:0; left:0; height:100%; width:100%; background:#000000; z-index:1500;}
#tinycontent{background:#ffffff; font-size:1.1em;}

#n{margin:10px auto; width:920px; border:1px solid #CCC;font-size:12px; line-height:30px;}
#n a{ padding:0 4px; color:#333}
</style>

		<script type="text/javascript" src="<%=path%>/js/tinybox.js"></script>
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body style="background: #fff;">
	
		<div class="bid_top">
		
		<div class="bid_top top">
		<label style="float:left;"><<</label>
		<label style="float: center;">投资详情</label>
		</div>
		<div class="bid_top middle">
		<strong><label id="title" style="margin-left: 30px;float:left;">中国移动供应商贷款</label></strong>
		</div>
		<div class="bid_top bottom">
				<div class="bid_top_bottom_label">
		<label>剩余时间：6天10小时7分钟36秒</label>
		<label style="float: right;">40%</label>
		</div>
		<div class="bid_top_bottom_label">
		<img style="width:100%;height:30px;" alt="#" src="">
		</div>
		
		</div>
		</div>
		
		
		<div class="bid_middle_1">
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;" id="rate">10.50</span>%</label><br>
		<label>年化利率</label>
		</div>
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;" id="term">2</span>个月</label><br>
		<label >投资期限</label>
		</div>
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;" id="totalNum">200,000</span>元</label><br>
		<label >融资总额</label>		
		</div>
		</div>
		<div class="bid_middle_2">
		<label style="font-size:28px;color:#989898;">剩余投资金额：<span style="color: #25c3da;" id="remainNum">		80,000</span></label><br>
		<label style="font-size:24px;color:#989898;">担保公司：<span style="color: #25c3da;" id="guaranteeCompany">湖南中与投资担保有限公司</span></label><br>
		<label style="font-size:24px;color:#989898;">还款方式：<span style="color: #25c3da;" id="returnType">按月分期还款</span></label><br>
		<label>本息保障	灵活转让</label>
		</div>
		
		<div class="bid_middle_3">
		<div class="bid_middle_3 tab">
		<div class="bid_middle_3_tab_tab1">借款质押物</div>
		<div class="bid_middle_3_tab_tab2">投标记录</div>
		</div>
		
		<div class="bid_middle_3 page">
		<label>借款人信息</label>
		<p>邓XX，45岁，已婚，我是蝴蝶开始打算打哈桑的行列萨丹哈拉升的拉黑谁对我好。</p>
		<label>借款人资金用途</label>
		<p>和郭德纲的反光板和的让它规范和土壤和合肥官方大山里的三角恋风精神科的丰盛的富哦三都赋。</p>
		<label>还款来源</label>
		<p>空间看ioiyohskskgdsakdsgsgaka和三等奖好看。</p>
		</div>
		
		</div>
		
		<div id="bid_hidden" class="bid_hidden" >
		<div class="bid_hidden_top">
		<label>剩余投资金额（元）：<span style="color: #25c3da;">55493054.00</span></label><br>
		<label>最多投标金额（元）：无限制</label><br>
		<label>我的账户金额（元）：<span style="color: #25c3da;">100.00</span></label>
		</div>
		<div class="bid_hidden_middle">
		<label>投资金额（元）：<span style="color: #25c3da;">55493054.00</span></label>
		</div>
		<div class="bid_hidden_middle">
		<label>到期预计可获本息（元）：<span style="color: #25c3da;">1000000.00</span></label>
		</div>
		<div class="bid_hidden_middle">
		
		</div>
		</div>
		
		
		<div id="hidden_pwd" class="hidden_pwd">
		<div class="hidden_pwd_text"><input style="width:90%;height:88px;font-size:28px; border:1px solid #25c3da;border-radius: 5px;" type="text" placeholder="请输入交易密码"  maxlength="11"></div>
		<div class="hidden_pwd_button">
		<div class="hidden_pwd_button_box">
		<div class="hidden_pwd_button_box1" style="background-color: #cccccc;">
		取消
		</div>
		<div class="hidden_pwd_button_box2">
		确定
		</div>
		</div>
		</div>
		</div>
		
		<div id="bid_bottom" class="bid_bottom" onclick="invest();">立即投资
		</div>
		<div id="ly" class="ly" >
    </div>
	</body> 
	<script>
	
	//	var info1="{status=7, code=100, mess=请求成功！, repayment_time=2015-08-22, returnType=按月付息到期还本, remainNum=0, totalNum=300000, title=信用标, rate=11, termType=0, valid_time=691200, term=3, investId=893, guaranteeCompany=湖南中御投资担保有限公司}";
	var info="${info.title}";

	init();
	
	function init(){
		$("#title").html("${info.title}");
		$("#rate").html("${info.rate}");
		$("#term").html("${info.term}");
		$("#totalNum").html("${info.totalNum}");
		$("#remainNum").html("${info.remainNum}");
		$("#guaranteeCompany").html("${info.guaranteeCompany}");
		$("#returnType").html("${info.returnType}");
	}
	
	function invest(){
		
	    //$("#ly").fadeIn(200);
	 	//$("#bid_hidden").fadeIn(200);
		
	 	//$("#hidden_pwd").fadeIn(200);
	 	popup($("#hidden_pwd")); 
	 	$("#ly").fadeIn(200);
	}
	
	function popup(popupName){ 
		var _scrollHeight = $(document).scrollTop(),//获取当前窗口距离页面顶部高度 
		_windowHeight = $(window).height(),//获取当前窗口高度 
		_windowWidth = $(window).width(),//获取当前窗口宽度 
		_popupHeight = popupName.height(),//获取弹出层高度 
		_popupWeight = popupName.width();//获取弹出层宽度 
		_posiTop = (_windowHeight - _popupHeight)/2 + _scrollHeight; 
		_posiLeft = (_windowWidth - _popupWeight)/2; 
		popupName.css({"left": _posiLeft + "px","top":_posiTop + "px","display":"block"});//设置position 
		} 
	</script>
</html>