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
		<title>账户信息</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>

    <script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body style="background: #eeeeee;">
		
		
		<div class="accountinfo_middle">
		<div class="accountinfo_middle box">
		<div class="accountinfo_middle box left">
		<label>头像</label>
		</div>
		<div class="accountinfo_middle box right">
		<img alt="#" src="http://${userimg}"></div>
		</div>
		
		<div class="accountinfo_middle box">
		<div class="accountinfo_middle box left">
		<label>账户名</label>
		</div>
		<div class="accountinfo_middle box right">${bindphone}</div>
		</div>
		
		<div class="accountinfo_middle box">
		<div class="accountinfo_middle box left">
		<label>昵称</label>
		</div>
		<div class="accountinfo_middle box right">${username}</div>
		</div>
		
		</div>
		
		<div class="accountinfo_bottom" onclick="quit();">退出账户
		</div>
		
	</body>
	<script>
	function quit(){
		$.post(rooturl + "/logout" , {} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			$.toast(resp.mess , 2000);
			
				setTimeout(function(){
					window.location.reload();
				},1000);
			
			
			})


	}
</script>
</html>