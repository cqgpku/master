<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<title>用户注册</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<!-- <link rel="stylesheet" href="/weixin/css/reset.css">
		<link rel="stylesheet" href="/weixin/css/register.css"> -->
		<link rel="stylesheet" href="${rootdomain}/css/reset.css">
		<link rel="stylesheet" href="${rootdomain}/css/register.css">
		<style>
			body div.btn_un{
				background-color:#ccc;
			}
		</style>
		<script>
			var rooturl = "${rootdomain}";
		</script>
	</head>
	<body>
		<dl class="phone_num">
			<dt>请输入手机号码</dt>
			<dd><input id="regist_phone" type="text" placeholder="请输入您的手机号码" type="tel" maxlength="11"></dd>
		</dl>
		<p class="ctsh">*您的手机号已经被注册</p>
		<dl class="password">
			<dt>登录密码</dt>
			<dd><input type="password" placeholder="请设置8-18位的登录密码" maxlength="18"></dd>
		</dl>
		<dl class="password_qr">
			<dt>再次输入登录密码</dt>
			<dd><input type="password" placeholder="请重复以上密码" maxlength="18"></dd>
		</dl>
		<!-- <dl class="nickname">
			<dt>用户昵称</dt>
			<dd><input type="text" placeholder="请设置2到8位中英文昵称" maxlength="8"></dd>
		</dl> -->
		<dl class="recom">
			<dt>推荐人</dt>
			<dd><input type="text" placeholder="选填"></dd>
		</dl>
		<dl class="code">
			<dt>验证码</dt>
			<dd class="code_num"><input type="text" placeholder="请输入验证码"></dd>
			<dd class="btn_get">获取验证码</dd>
		</dl>
		<p class="xybar">注册代表已同意<span class="ptyhsyxy">《平台用户使用协议》</span></p>
		<div class="btn_refist">立即注册</div>

		<!-- <script type="text/javascript" src="/weixin/js/zepto.js"></script>
		<script type="text/javascript" src="/weixin/js/integra.js"></script> -->
		<script type="text/javascript" src="${rootdomain}/js/zepto.js"></script>
		<script type="text/javascript" src="${rootdomain}/js/integra.js"></script>
	</body>
</html>