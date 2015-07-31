<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head lang="en">
    <meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=0.5,maximum-scale=1.0,minimum-scale=0.5,user-scalable=0,width=device-width,maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<title>充值页面</title>
    <link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
    <link rel="stylesheet" href="<%=path%>/css/pluginstyle.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js?v=1"></script>
    <script>
			var rooturl = "<%=basePath%>";
		</script>
</head>
<body  style="background: #f8f8f8;">
<div class="recharge_top">
<div class="recharge_top top">
		<label style="float:left;"></label>
		<label style="float: center;">充值</label>
		</div>
		<div class="recharge_top middle">
		<label style="float: center;">可用金额（元）</label><br>
		<label style="float: center;font-size: 60px;" id="availableAmount">--</label>
		</div>
</div>
<div class="recharge_middle">
<div class="recharge_middle_text"><input id="money" style="width:100%;height:88px;font-size:28px; border:1px solid #cccccc;" type="text" placeholder="请输入充值金额"  maxlength="11"></div>
<div class="recharge_middle_button">
	<div class="recharge_middle_button_box" onclick="recharge();">
		确定充值
		</div>
</div>
</div>
		
</body>
<script>
init()

function init(){
	//初始化投资金额个人信息界面
	$.post(rooturl + "/getmyaccountinfo" , {} , function(resp){
		if(typeof(resp) != "object"){
			resp = JSON.parse(resp);
		}
		if(resp.code == "100"){
			$("#availableAmount").html(resp.availableAmount);
		}else{
			$.toast(resp.mess , 2000);
		}
		
		})
}

function recharge(){
	//添加银行卡
		var money = $('#money').val();
		
		$.post(rooturl + "/mobilepay" , {money:money} , function(resp){
			
			if(resp.code=="0")
			{
				window.location.href=resp.url;
				/* $.toast('充值成功！' , 2000);
				var orginmoney=$("#availableAmount").val()==""?"0":$("#availableAmount").val();
				var newmoney=parseFloat(money)+parseFloat(orginmoney);
				$("#availableAmount").html(newmoney); */
			}else{
				$.toast('充值失败！' , 2000);
			}
		})
	
}
</script>
</html>
