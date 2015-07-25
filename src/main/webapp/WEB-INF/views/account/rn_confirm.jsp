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
	
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>实名认证</title>
    <link href="../dist/css/normalize.css" rel="stylesheet">
    <link href="../dist/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/reset.css">
		<link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/zepto.js"></script>
		<script type="text/javascript" src="../js/integra.js"></script>
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
<body class="rn_confirm">
<div class="rn">
    <div class="rn_before"></div>
    <h2 class="rn_topic">实名认证</h2>
</div>
<div class="rn_input">
   
        <div class="rn_name">
            <input  type="text" name="password1" placeholder="请输入姓名">
        </div>
        <div class="rn_id">
            <input  type="text" name="password2" placeholder="请输入身份证号">
        </div>
        <div class="rn_sub">
            <input class="rn_submit" type="button" value="认证"  onclick="renzhen();">
        </div>
        <div class="skip_confirm">
           <span class="skip_font"> 跳过</span>
        </div>
   
</div>
</body>
<script>
	function renzhen(){
		var name=$("input[name='password1']").val();
		var identitycardid=$("input[name='password2']").val();
		$.post(rooturl + "/rn_confirm" , {realname:name,id:identitycardid} , function(resp){
			var result=eval('(' + resp + ')')
			if(result.code=="0")
			{
				$.toast('认证成功！' , 2000);
			}else{
				$.toast('认证失败！' , 2000);
			}
			})


	}
</script>
</html>
