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
		<title>大客户</title>
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
		<div class="targetCustomer_top">
		<div class="targetCustomer_top top">预约借款</div>
		<div class="targetCustomer_top middle">
		<label >预约投资</label>
		</div>
		</div>
		
		<div class="targetCustomer_middle">
		<div class="targetCustomer_middle box">
		<div class="targetCustomer_middle box left">
		<div style="height:140px;border-bottom: 1px solid #cccccc;line-height: 30px;">
		<div style="height:60px;line-height: 60px;">
		<label style="font-size: 24px;color:#494949;">信用标&nbsp;<span style="background: #25c3da;border-radius: 5px;font-size: 20px;color:#cccccc;">期限3个月</span></label>
		</div>
		<div style="height:80px;line-height: 30px;"><label style="color: #25c3da;font-size:28px;float:left;">11.00% &nbsp;&nbsp;</label><label style="color: #494949;font-size:28px;float:center;">300,000.00</label><br>
		<label style="float:left;">年化收益 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label><label style="float:center;">融资总额（元）</label>
		</div>
		</div>
		<div style="height:60px;line-height: 60px;"><label>湖南中与投资担保有限公司担保</label></div>
		</div>
		<div class="targetCustomer_middle box right"></div>
		</div>
		
		<div class="targetCustomer_middle box">
		<div class="targetCustomer_middle box left">
		<div style="height:140px;border-bottom: 1px solid #cccccc;line-height: 30px;">
		<div style="height:60px;line-height: 60px;">
		<label style="font-size: 24px;color:#494949;">信用标&nbsp;<span style="background: #25c3da;border-radius: 5px;font-size: 20px;color:#cccccc;">期限3个月</span></label>
		</div>
		<div style="height:80px;line-height: 30px;"><label style="color: #25c3da;font-size:28px;float:left;">11.00% &nbsp;&nbsp;</label><label style="color: #494949;font-size:28px;float:center;">300,000.00</label><br>
		<label style="float:left;">年化收益 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label><label style="float:center;">融资总额（元）</label>
		</div>
		</div>
		<div style="height:60px;line-height: 60px;"><label>湖南中与投资担保有限公司担保</label></div>
		</div>
		<div class="targetCustomer_middle box right"></div>
		</div>
		
		</div>
		
		
	</body>
</html>