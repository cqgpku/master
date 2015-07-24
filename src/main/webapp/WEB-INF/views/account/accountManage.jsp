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
		<title>账户管理</title>
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
		<div style="margin-top:10px;border-top: 1px solid #cccccc;">
		<div class="accountmanage_box">
		<div class="accountmanage_box left">
		<img alt="#" src="img/undone.png">&nbsp;
		<label>实名认证</label></div>
		<div class="accountmanage_box right">
		<label>${realname==""?"未认证":"已认证"}></label></div>
		</div>
		<div class="accountmanage_box">
		<div class="accountmanage_box left">
		<img alt="#" src="img/done.png">&nbsp;
		<label>绑定手机</label></div>
		<div class="accountmanage_box right">
		<label>${bindphone}</label></div>
		</div>
		<div class="accountmanage_box">
		<div class="accountmanage_box left">
		<img alt="#" src="img/done.png">&nbsp;
		<label>绑定邮箱</label></div>
		<div class="accountmanage_box right">
		<label>${bindemail} ></label></div>
		</div>
		<div class="accountmanage_box">
		<div class="accountmanage_box left">
		<img alt="#" src="img/done.png">&nbsp;
		<label>交易密码</label></div>
		<div class="accountmanage_box right">
		<label>已设置，点击修改 ></label></div>
		</div>
		
			</div>
		
	</body>
</html>