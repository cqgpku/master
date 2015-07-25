<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
	
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>意见反馈</title>
    <link href="dist/css/normalize.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
<body>
    <div class="fd">
        <div class="fd_before"></div>
        <h2 class="fd_topic">意见反馈</h2>
    </div>
    <div class="fd_input">
        <form>
            <div >
                <textarea class="fd_feedback" type="text" name="feedback" placeholder="请写下您的宝贵意见及建议"></textarea>
            </div>
            <div>
                <textarea class="fd_contact" type="text" name="contact" placeholder="请留下您的联系方式QQ/手机/邮箱"></textarea>
            </div>
            <div class="fd_sub">
                <input class="fd_submit" type="submit" value="æäº¤">
            </div>
        </form>
    </div>
</body>
</html>
