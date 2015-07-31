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
		<title>重置密码</title>
    <link href="dist/css/normalize.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
<body>
    <div class="pr">
        <div class="pr_before"></div>
        <h2 class="pr_topic">重置密码</h2>
    </div>
    <div class="pr_input">
        <form action="" method="post">
            <div >
                <input class="pr_feedback" type="text" name="password1" placeholder="新密码">
            </div>
            <div>
                <input class="pr_contact" type="text" name="password2" placeholder="请再输入一次">
            </div>
            <div class="pr_sub">
                <input class="pr_submit" type="submit" value="重置密码">
            </div>
        </form>
    </div>
</body>
</html>
