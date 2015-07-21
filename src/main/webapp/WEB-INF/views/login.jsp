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
		<title>用户注册</title>
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
	<body>
		<div class="logo"></div>
		<dl class="phone_num first" style="margin-top:10px;">
			<dd><input type="text" placeholder="请输入您的手机号码" type="tel" maxlength="11"></dd>
		</dl>
		<dl class="password end">
			<dd><input type="password" placeholder="请输入您的登录密码" maxlength="18"></dd>
		</dl>
		<div class="btn_login">立即登陆</div>
		<div class="goto_regist">注册</div>

		<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
		<!-- <script type="text/javascript" src="/js/zepto.js"></script>
		<script type="text/javascript" src="/js/integra.js"></script> -->
	</body>
</html>