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
		<title>首页</title>
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
		<div class="homepage_top"></div>
		<div class="home_middle_box">
		<div class="home_middle_box left1">
		</div>
		<div class="home_middle_box right">
		<p><span style="font-size: 34px;color:#989898;" onclick="window.location.href='<%=basePath%>jwinvests'">绝味专区</span><br>
		描述描述描述描述</p>
		</div></div>
		<div class="home_middle_box">
		<div class="home_middle_box left2">
		</div>
		<div class="home_middle_box right">
		<p><span style="font-size: 34px;color:#989898;" onclick="window.location.href='<%=basePath%>invests'">转贷专区</span><br>
		描述描述描述描述</p>
		</div></div>
		<div class="home_middle_box">
		<div class="home_middle_box left3">
		</div>
		<div class="home_middle_box right">
		<p><span style="font-size: 34px;color:#989898;" onclick="window.location.href='<%=basePath%>targetcustomer/1'">散标投资</span><br>
		描述描述描述描述</p>
		</div></div>
		
	</body>
</html>