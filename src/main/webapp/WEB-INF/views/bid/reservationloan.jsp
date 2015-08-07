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
		<title>预约借款</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<link rel="stylesheet" href="<%=path%>/css/pluginstyle.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		
		<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
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
		<label>借款金额：</label>
		</div>
		<div id="money" class="addbank_middle box right"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>期望利率：</label>
		</div>
		<div id="rate" class="addbank_middle box right"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>借款周期：</label>
		</div>
		<div id="timedes" class="addbank_middle box right"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>借款用途：</label>
		</div>
		<div id="des" class="addbank_middle box right"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>电话号码：</label>
		</div>
		<div id="phone" class="addbank_middle box right">${phone}</div>
		</div>
		
		</div>
		
		<div class="addbank_bottom" onclick="addbank();">预约
		</div>
		<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js?v=1"></script>
	</body>
		<script>
		
	
	function reservation(){
		//添加银行卡
			var money = $('#money').val();
			var rate = $('#rate').val();
			var timedes = $('#timedes').val();
			var des = $('#des').val();
			var phone = $('#phone').val();
			
			
			$.post(rooturl + "/reservationloan" , {money:money,rate:rate,timedes:timedes,des:des,phone:phone} , function(resp){
				if(typeof(resp) != "object"){
					resp = JSON.parse(resp);
				}
				if(resp.code=="0")
				{
					$.toast(resp.mess , 2000);
				}else{
					$.toast(resp.mess , 2000);
				}
			})
		
	}
</script>
</html>