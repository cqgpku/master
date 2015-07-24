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
		<title>交易记录</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body>
	
		<div class="deal_box">
		<div class="deal_box top">15.05</div>
		<div class="deal_box bottom">
		<div class="deal_box bottom record">
		<div class="deal_box_time">
		<div class="deal_box_time_label">
		<span style="font-size: 34px;color: #494949;">30</span><br><span style="font-size: 24px;">12:23</span>
		</div>
		<div class="deal_box_time_img"><img style="width:12px;height:140px;" src="img/border.png"></div>
		</div>
		<div class="deal_box_content">
<div class="deal_box_content_box"><div class="deal_box_content_box_label">交易记录详情交易记录详情交易记录详情交易记录详情交易记录详情</div></div>
</div>
		</div>
		
		<div class="deal_box bottom record">
		<div class="deal_box_time">
		<div class="deal_box_time_label">
		<span style="font-size: 34px;color: #494949;">30</span><br><span style="font-size: 24px;">12:23</span>
		</div>
		<div class="deal_box_time_img"><img style="width:12px;height:140px;" src="img/border.png"></div>
		</div>
		<div class="deal_box_content">
<div class="deal_box_content_box"><div class="deal_box_content_box_label">交易记录详情交易记录详情交易记录详情交易记录详情交易记录详情</div></div>
</div>
		</div>
		
		<div class="deal_box bottom record">
		<div class="deal_box_time">
		<div class="deal_box_time_label">
		<span style="font-size: 34px;color: #494949;">30</span><br><span style="font-size: 24px;">12:23</span>
		</div>
		<div class="deal_box_time_img"><img style="width:12px;height:140px;" src="img/border.png"></div>
		</div>
		<div class="deal_box_content">
<div class="deal_box_content_box"><div class="deal_box_content_box_label">交易记录详情交易记录详情交易记录详情交易记录详情交易记录详情</div></div>
</div>
		</div>
		
		<div class="deal_box bottom record">
		<div class="deal_box_time">
		<div class="deal_box_time_label">
		<span style="font-size: 34px;color: #494949;">30</span><br><span style="font-size: 24px;">12:23</span>
		</div>
		<div class="deal_box_time_img"><img style="width:12px;height:140px;" src="img/border.png"></div>
		</div>
		<div class="deal_box_content">
<div class="deal_box_content_box"><div class="deal_box_content_box_label">交易记录详情交易记录详情交易记录详情交易记录详情交易记录详情</div></div>
</div>
		</div>
		
		</div>
		</div>
		
		
	</body>
</html>