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
		<title>我的账户</title>
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
		<div class="account_top">
		
		<div class="account_top top">
		<label style="margin-top:10px;">我的账户</label>
		<label style="margin-top:10px;margin-right:20px;font-size:28px;float:right;" onclick="window.location.href='<%=basePath%>recharge'">充值</label>
		</div>
		<div class="account_top middle">
		<div class="account_top_middle_img" onclick="window.location.href='<%=basePath%>accountinfo'">
		<img alt="#" src="http://${userimg}">
		<label style="width:60px;height:30px;font-size: 28px;">${username}</label>
		</div>
		<div class="account_top_middle_label">
		<label style="width:150px;height:30px;">累计收益(元)</label><br>
		<label id="accumulatedIncome" style="width:200px;height:80px;font-size:40px;">--</label>
		</div>
		</div>
		<div class="account_top bottom">
				<div class="account_top_bottom_label">
		<label style="width:150px;height:20px;">可用金额(元)</label><br>
		<label id="availableAmount" style="width:200px;height:40px;font-size:40px;">--</label>
		</div>
		<div class="account_top_bottom_label">
		<label style="width:150px;height:20px;">账户总额(元)</label><br>
		<label id="accountTotalAmount" style="width:200px;height:40px;font-size:40px;">--</label>
		</div>
		
		</div>
		</div>
		<div class="account_middle">
		<div class="account_middle_content">
		<div class="account_middle_content_block" onclick="window.location.href='<%=basePath%>dsxq'">
		<img alt="#" src="../img/1.png"><br>
		<label>代收详情</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;" onclick="window.location.href='<%=basePath%>dealinfo'">
		<img alt="#" src="../img/2.png"><br>
		<label>交易记录</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;" onclick="window.location.href='<%=basePath%>bankcards'">
		<img alt="#" src="../img/3.png"><br>
		<label>银行卡</label>
		</div>
		</div>
		<div class="account_middle_content">
		<div class="account_middle_content_block" onclick="window.location.href='<%=basePath%>jwinvests'">
		<img alt="#" src="../img/4.png"><br>
		<label>绝味专区</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;" onclick="window.location.href='<%=basePath%>invests'">
		<img alt="#" src="../img/5.png"><br>
		<label>转贷专区</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;" onclick="window.location.href='<%=basePath%>targetcustomer/20106'">
		<img alt="#" src="../img/6.png"><br>
		<label>大客户</label>
		</div>
		</div>
		<div class="account_middle_content">
		<div class="account_middle_content_block" onclick="window.location.href='<%=basePath%>accountmanage'">
		<img alt="#" src="../img/7.png"><br>
		<label>账户管理</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/8.png"><br>
		<label style="color:#ff0033;">手势密码</label>
		</div>
		<div class="account_middle_content_block" style="margin-left: 10px;">
		<img alt="#" src="../img/9.png"><br>
		<label style="color:#ff0033;">提现</label>
		</div>
		</div>
		</div>
		
		
	</body>
	<script>
	var info="${info.accumulatedIncome}";
 init();
	
	function init(){
		$("#accumulatedIncome").html("${info.accumulatedIncome}");
		$("#availableAmount").html("${info.availableAmount}");
		$("#accountTotalAmount").html("${info.accountTotalAmount}");
	} 
	
	</script>
</html>