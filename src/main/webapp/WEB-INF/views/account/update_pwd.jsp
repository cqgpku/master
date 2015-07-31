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
		<title>修改交易密码</title>
	    <link href="dist/css/normalize.css" rel="stylesheet">
	    <link href="dist/css/style.css" rel="stylesheet">
	    <script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
	    
		<script>
			var rooturl = "<%=basePath%>";
		</script>
		<style type="text/css">
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
<body>
<div class="up">
    <div class="up_before"></div>
    <h2 class="up_topic">修改交易密码</h2>
</div>
<div class="up_input">
    <form action="" method="post">
        <div>
            <input type="password" name="old_password" placeholder="原密码">
        </div>
        <div>
            <input  type="password" name="new_password" placeholder="新密码（8—16位，不能为纯数字或字母）">
        </div>
        <div>
            <input  type="password" name="new_password2" placeholder="请再输入一次">
        </div>
        <div class="up_sub">
            <input class="up_submit" type="button" onclick="change_pwd()" value="确定">
        </div>
    </form>
</div>
<script>
	var result = ${rootdomain};
	function change_pwd(){
		var oldPassword=$("input[name='old_password']").val();
		var newPassword=$("input[name='new_password']").val();
		var newPassword2=$("input[name='new_password2']").val();
		if(newPassword != newPassword2) 
		{
				$.toast('两次新密码不相等' , 2000);
		}
		else
		{
			//$.post(rooturl + "/rn_confirm" , {realname:name,id:identitycardid} , function(resp){
			alert("code="+result.result+ result.resultDesc)
			$.post(rooturl + "/update_pwd" , {old_password:12345678, new_password:newPassword} , function(resp){
		   if(result.result=="100")
		   {
				$.toast('修改成功！' , 2000);
			}
			else if(result.result==104){
				$.toast('用户不存在' , 2000);
			}
			else if(result.result==117){
				$.toast('原交易错误' , 2000);
			}else
			{
				$.toast(result.result + result.resultDesc + '修改失败' , 2000);
			}
			})
		}
	}
</script>
</body>
</html>
