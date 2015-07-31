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
		<title>验证账户信息</title>
    <link href="dist/css/normalize.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	<style>
		 .pr_left{
            margin-top: 20px;
            width: 85%;
            height: 80px;
            font-size: 28px;
            margin:0;
            outline: none;;
            border:none;
        }
        .gp_identify{
            background-color: white;
        }
        .pr_left{
            font-size: 28px;
          
        }
         .pr_idcode{       
            color: #25c3da;
            font-size: 28px;
            border:none;
            background-color:white;
            outline:none;
        }
         a{
            text-decoration: none;
            color: #25c3da;
             font-size: 28px;
        }
       .dialog{
			position: fixed;
			width: 270px;
			background-color: black;
			height: 34px;
			-webkit-border-radius: 5px;
			color: #fff;
			font-size: 13px;
			text-align: center;
			line-height: 34px;
}
		body div.btn_un{
			background-color:#ccc;
		}
</style>	
	</head>
<body class="ia_confirm">
<div class="ia">
    <div class="ia_before"></div>
    <h2 class="ia_topic">验证账户信息</h2>
</div>
<div class="phone_num" style="width: 88px;margin-bottom: 20px;margin-left:5px;font-size: 28px;  font-family: "微软雅黑";>
18513009069
</div>
<div class="pr_input">   
        <div class="gp_identify code">
            <input class="pr_left code_num " style="display:inline" type="text" name="code" placeholder="请输入验证码"> 
            <a class="pr_idcode btn_get">获取验证码</a>
         </div>    
		<div class="pr_sub">
		     <input class="pr_submit" type="submit" value="下一步">
		</div>
</div>  
  

<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
<script type="text/javascript" src="<%=path%>/js/integra.js"></script> 
</body>
</html>
