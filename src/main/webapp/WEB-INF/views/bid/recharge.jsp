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
    <meta charset="UTF-8">
    <title>充值页面</title>
    <link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script>
			var rooturl = "<%=basePath%>";
		</script>
</head>
<body  style="background: #f8f8f8;">
<div class="recharge_top">
<div class="recharge_top top">
		<label style="float:left;"><<</label>
		<label style="float: center;">充值</label>
		</div>
		<div class="recharge_top middle">
		<label style="float: center;">可用金额（元）</label><br>
		<label style="float: center;font-size: 60px;">125,00.00</label>
		</div>
</div>
<div class="recharge_middle">
<div class="recharge_middle_text"><input style="width:100%;height:88px;font-size:28px; border:1px solid #cccccc;" type="text" placeholder="请输入充值金额"  maxlength="11"></div>
<div class="recharge_middle_button">
	<div class="recharge_middle_button_box" onclick="submit();">
		确定充值
		</div>
</div>
</div>
		
</body>
<script>
	function submit(){
		$.post(rooturl + "/getbindcardcode" , {phone:"18810350207"} , function(resp){
			if("false" == (resp.toString())){
				$.toast('验证码获取失败！');
			}else{
				$.toast('验证码获取成功，请保持手机畅通！' , 2000);
			}
		})
		
		
	}
</script>
</html>
