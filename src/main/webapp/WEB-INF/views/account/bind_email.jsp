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
	<meta name="keywords" content="" />
	<meta name="description" content="" />
    <title>绑定邮箱</title>
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
<div class="be">
    <div class="be_before"></div>
    <h2 class="be_topic">绑定邮箱</h2>
</div>
<div class="be_input">
        <div >
            <input class="be_email" type="text" name="bind_email" placeholder="请输入您要绑定的邮箱">
        </div>
        <div class="be_sub">
            <input class="be_submit" type="button" onclick="bindemail()" value="确定">
        </div>
</div>
</body>
<script>
    var result = ${rootdomain};
	function bindemail(){
		var email=$("input[name='bind_email']").val();
		//var name=$("input[name='password1']").val();
		if(!email) 
			{
				$.toast('请填写邮箱！' , 2000);
			}
		else
			{
			alert("code="+result.result+ result.resultDesc)
		$.post(rooturl + "/bind_email" , {bind_email:email} , function(resp){
		   if(result.result=="100")
			{
				$.toast('绑定成功！' , 2000);
			}
			else if(result.result==104){
				$.toast('用户不存在' , 2000);
			}
			else if(result.result==118){
				$.toast('邮箱格式错误' , 2000);
			}
			else if(result.result==119){
				$.toast('邮箱已被使用' , 2000);
			}
			else if(result.result==110){
				$.toast('系统异常' , 2000);
			}else
			{
				$.toast('绑定失败' , 2000);
			}
			})
		}
	}

</script>
</html>
