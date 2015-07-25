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
		<title>测试页面</title>
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
	<body style="background: #eeeeee;">
		
		<div style="width:100%;height:88px;font-size: 28px;line-height: 88px;">${phone} 已登录</div>
		<div class="addbank_middle">
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>注册：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>register/page';return false">
		测试注册功能接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>1首页：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>homepage';return false">
		测试首页功能接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>20我的账户：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>myaccount/page';return false">
		测试我的账户功能接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>账户管理：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>accountmanage';return false">
		测试账户管理功能接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>账户修改：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>accountinfo';return false">
		测试账户信息修改接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>10绑定邮箱：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>accountinfo';return false">
		测试绑定邮箱接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>3*标的列表：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='#';return false">
		测试标的列表接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>4标的详情：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>bidinfo/893';return false">
		测试标的详情接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>34代收详情：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>dsxq';return false">
		测试代收详情接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>33交易记录：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>dealinfo';return false">
		测试交易记录接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>35大客户：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>targetcustomer/1';return false">
		测试大客户信息接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>37投资列表：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>invests';return false">
		测试投资列表接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>27银行卡列表：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>bankcards';return false">
		测试银行卡列表接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>21添加银行卡：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>addbankcard';return false">
		测试添加银行卡接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>充值页面：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='<%=basePath%>recharge';return false">
		测试充值接口</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>31*提现功能：</label>
		</div>
		<div class="addbank_middle box right" style="color:#ff0000;cursor:pointer;" onclick="window.location.href='#';return false">
		测试提现接口</div>
		</div>
		
		
		
		</div>
		
		<div class="addbank_bottom">确认添加
		</div>
		
	</body>
</html>