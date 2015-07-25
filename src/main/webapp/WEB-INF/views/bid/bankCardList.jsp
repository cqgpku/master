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
		<title>银行卡列表</title>
    <link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
    <script>
			var rooturl = "<%=basePath%>";
		</script>
</head>
<body  style="background: #eeeeee;">
<div class="bankcard_top">
		<label style="float:left;margin-left:15px;"><</label>
		<label style="float: center;">银行卡</label>
		<label style="float:right;margin-right:15px;"><span onclick="addbank();">+</span></label>
</div>
<div class="bankcard_middle">
<div class="bankcard_middle_box">
<div class="bankcard_middle_box_label" id="bank1" onclick="showdelete(this);">
	<label >交通银行北京海淀支行</label><br>
	<label style="color:#cccccc;">尾号0909</label>
	</div>
	<div class="bankcard_middle_box_delete" id="bank1delete" onclick="deletebank(this);">删除</div>
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
	
	function showdelete(obj){
		$("#"+obj.id).css("margin-left","-150px");
		$("#"+obj.id+"delete").css({"margin-right":"0","display":"block"});
	}
	
	function deletebank(obj){
		alert("删除"+obj.id);
	}
	
	function addbank(){
		window.location.href=rooturl + "/addbankcard";
	}
</script>
</html>
