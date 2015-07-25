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
	
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>绑定邮箱</title>
    <link href="dist/css/normalize.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
<body>
<div class="up">
    <div class="up_before"></div>
    <h2 class="up_topic">修改交易密码</h2>
</div>
<div class="up_input">
    <form action="" method="post">
        <div >
            <input type="text" name="old_password" placeholder="原密码">
        </div>
        <div>
            <input  type="text" name="new_password" placeholder="新密码">
        </div>
        <div>
            <input  type="text" name="new_password2" placeholder="请再输入一次">
        </div>
        <div class="up_sub">
            <input class="up_submit" type="submit" value="确定">
        </div>
    </form>
</div>
</body>
</html>
