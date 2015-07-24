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
		<title>关于</title>
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
		<div style="text-align: center;">
		<div class="about_top">
		<img alt="#" src="img/logo.png"></div>
				
		<div class="about_middle">
		<p>储钱罐（www.cqg365.com）————中御集团成员，隶属于北京中御财富网络科技有限公司</p></div>
		<div class="about_bottom">
		<div class="about_bottom bottom">
		<p>官方微信：cqg365_2015<br>
		客服热线：400-080-0111<br>
		官方微博：weibo.com/cqg365</p>
		</div>
		</div>
		</div>
	</body>
</html>