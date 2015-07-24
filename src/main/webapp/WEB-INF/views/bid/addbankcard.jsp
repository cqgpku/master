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
		<title>添加银行卡</title>
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
	<body style="background: #eeeeee;">
		
		
		<div class="addbank_middle">
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>银行卡类型：</label>
		</div>
		<div class="addbank_middle box right">
		借记卡</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>真实姓名：</label>
		</div>
		<div class="addbank_middle box right">*婷</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>身份证号：</label>
		</div>
		<div class="addbank_middle box right">138392220*********</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>开户行：</label>
		</div>
		<div class="addbank_middle box right"><input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入开户行"  maxlength="20"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>开户地区：</label>
		</div>
		<div class="addbank_middle box right"><input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入开户地区"  maxlength="20"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>支行名称：</label>
		</div>
		<div class="addbank_middle box right"><input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入支行名称"  maxlength="20"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>银行账号：</label>
		</div>
		<div class="addbank_middle box right"><input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入银行账号"  ></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>手机号码：</label>
		</div>
		<div class="addbank_middle box right"><input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入手机号"  maxlength="20"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>验证码：</label>
		</div>
		<div class="addbank_middle box right" ><input style="width:180px;height:88px;font-size:28px;  type="text" placeholder="请输入验证码"  maxlength="20">
		<input style="width:180px;height:100px;font-size:28px;color:#25c3da;float:right;line-height: 100px;" value="获取验证码"></div>
		</div>
		
		</div>
		
		<div class="addbank_bottom">确认添加
		</div>
		
	</body>
</html>