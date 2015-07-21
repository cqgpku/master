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
	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>绑定邮箱</title>
    <link href="dist/css/normalize.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
</head>
<body>
<div class="be">
    <div class="be_before"></div>
    <h2 class="be_topic">绑定邮箱</h2>
</div>
<div class="be_input">
    <form action="" method="post">
        <div >
            <input class="be_email" type="text" name="password1" placeholder="请输入您要绑定的邮箱">
        </div>
        <div class="be_sub">
            <input class="be_submit" type="submit" value="确定">
        </div>
    </form>
</div>
</body>
</html>
