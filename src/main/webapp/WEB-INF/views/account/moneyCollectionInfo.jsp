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
		<title>代收详情</title>
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
	<body style="background: #fff;">
		<div class="collect_top">
		
		<div class="collect_top top">
		<label style="float:left;"><<</label>
		<label style="float: center;">待收详情</label>
		</div>
		<div class="collect_top middle">
		<label >待收总额（元）</label><br>
		<label id="sum" style="font-size: 60px;">125,00.00</label>
		</div>
		<div class="collect_top bottom">
		
				<label>接收利息（元）</label><br>
		<label id="interest" style="font-size: 50px;">125.00</label>
		</div>
		</div>
		
		
		<div class="collect_middle">
		<div class="collect_middle box">
		<label >最近7日待收金额（元）</label><br>
		<label id="recent7Amount" style="font-size:28px;color:#494949;">10000.00</label>
		</div>
		<div class="collect_middle box">
		<label >最近7日待收利息（元）</label><br>
		<label id="recent7Interest" style="font-size:28px;color:#494949;">100.00</label>
		</div>
		</div>
		
		<div class="collect_bottom">
		<label style="float:left;margin-left:30px;margin-top:20px;">最近待收日期：<span id="recentDate" style="font-size: 24px;color:#989898;">2015-06-12</span></label>
		</div>
		
		
	</body>
	<script>
	
	init();
	
	function init(){
		$("#sum").html("${info.sum}");
		$("#interest").html("${info.interest}");
		$("#recent7Amount").html("${info.recent7Amount}");
		$("#recent7Interest").html("${info.recent7Interest}");
		$("#recentDate").html("${info.recentDate}");
	}
	</script>
</html>