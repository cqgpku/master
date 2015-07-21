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
		<title>我的账户</title>
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
		<div class="account_top">
		
		<div class="account_top top">
		<label style="margin-top:10px;">我的账户</label>
		<label style="margin-top:10px;margin-right:10px;font-size:18px;float:right;">充值</label>
		</div>
		<div class="account_top middle">
		<div class="account_top_middle_img">
		<img alt="#" src="../img/logo.png">
		<label style="width:60px;height:30px;">Tina</label>
		</div>
		<div class="account_top_middle_label">
		<label style="width:150px;height:30px;font-size:14px;">累计收益(元)</label><br>
		<label style="width:200px;height:80px;font-size:18px;">100,250.00</label>
		</div>
		</div>
		<div class="account_top bottom">
				<div class="account_top_bottom_label">
		<label style="width:150px;height:20px;font-size:14px;">可用金额(元)</label><br>
		<label style="width:200px;height:40px;font-size:18px;">100.00</label>
		</div>
		<div class="account_top_bottom_label">
		<label style="width:150px;height:20px;font-size:14px;">账户总额(元)</label><br>
		<label style="width:200px;height:40px;font-size:18px;">100,2500.00</label>
		</div>
		
		</div>
		</div>
		<div class="account_middle">
		<div class="account_middle_content">
		<div class="account_middle_content_block">
		<img alt="#" src="../img/logo.png"><br>
		<label>代收详情</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/logo.png"><br>
		<label>交易记录</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/logo.png"><br>
		<label>银行卡</label>
		</div>
		</div>
		<div class="account_middle_content">
		<div class="account_middle_content_block">
		<img alt="#" src="../img/logo.png"><br>
		<label>绝味专区</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/logo.png"><br>
		<label>转贷专区</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/logo.png"><br>
		<label>大客户</label>
		</div>
		</div>
		<div class="account_middle_content">
		<div class="account_middle_content_block">
		<img alt="#" src="../img/logo.png"><br>
		<label>账户管理</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/logo.png"><br>
		<label>手势密码</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/logo.png"><br>
		<label>体现</label>
		</div>
		</div>
		</div>
		
		
	</body>
</html>