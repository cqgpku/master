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
		<title>更多功能</title>
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
		<div style="margin-top:10px;border-top: 1px solid #cccccc;">
		<div class="morefunction_box">
		<div class="morefunction_box left">
		<img alt="#" src="img/logo.png">&nbsp;
		<label>活动</label></div>
		<div class="morefunction_box right">
		<label>>></label></div>
		</div>
		<div class="morefunction_box">
		<div class="morefunction_box left">
		<img alt="#" src="img/logo.png">&nbsp;
		<label>意见反馈</label></div>
		<div class="morefunction_box right">
		<label>>></label></div>
		</div>
		<div class="morefunction_box">
		<div class="morefunction_box left">
		<img alt="#" src="img/logo.png">&nbsp;
		<label>关于</label></div>
		<div class="morefunction_box right">
		<label>>></label></div>
		</div>
		
		<div class="morefunction_bottomimg">
		<img style="width:220px;height:180px;" alt="#" src="img/logo.png"></div>
		</div>		
		
	</body>
</html>