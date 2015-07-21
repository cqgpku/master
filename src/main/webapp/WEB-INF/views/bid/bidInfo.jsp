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
		<meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<title>标的详情</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
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
		<label style="margin-left: 30px;float:left;"><strong>中国移动供应商贷款</strong></label>
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
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;">10.50</span>%</label><br>
		<label >年化利率</label>
		</div>
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;">2</span>个月</label><br>
		<label >投资期限</label>
		</div>
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;">200,000</span>元</label><br>
		<label >融资总额</label>		
		</div>
		</div>
		<div class="bid_middle_2">
		<label style="font-size:28px;color:#989898;">剩余投资金额：<span style="color: #25c3da;">		80,000</span></label><br>
		<label style="font-size:24px;color:#989898;">担保公司：湖南中与投资担保有限公司<span style="color: #25c3da;"></span></label><br>
		<label style="font-size:24px;color:#989898;">还款方式：按月分期还款<span style="color: #25c3da;"></span></label><br>
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
		
		<div class="bid_hidden">
		<div class="bid_hidden top">
		<label>剩余投资金额（元）：<span style="color: #25c3da;">55493054.00</span></label><br>
		<label>最多投标金额（元）：无限制</label><br>
		<label>我的账户金额（元）：<span style="color: #25c3da;">100.00</span></label>
		</div>
		<div class="bid_hidden middle">
		<label>投资金额（元）：<span style="color: #25c3da;">55493054.00</span></label>
		</div>
		<div class="bid_hidden middle">
		<label>到期预计可获本息（元）：<span style="color: #25c3da;">1000000.00</span></label>
		</div>
		<div class="bid_hidden middle">
		
		</div>
		</div>
		
		<div class="bid_bottom">立即投资
		</div>
		
	</body>
</html>