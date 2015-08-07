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
		<title>交易记录</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body>
	
		<div class="deal_box">
		<div class="deal_box top"></div>
		<div class="deal_box bottom" id="deal_box_bottom">
		<!-- <div class="deal_box bottom record">
		<div class="deal_box_time">
		<div class="deal_box_time_label">
		<span style="font-size: 34px;color: #494949;">30</span><br><span style="font-size: 24px;">12:23</span>
		</div>
		<div class="deal_box_time_img"><img style="width:12px;height:140px;" src="img/border.png"></div>
		</div>
		<div class="deal_box_content">
<div class="deal_box_content_box"><div class="deal_box_content_box_label">交易记录详情交易记录详情交易记录详情交易记录详情交易记录详情</div></div>
</div>
		</div> -->
		
		
		
		</div>
		</div>
		
		
	</body>
	<script>
init();

	function init(){
		$.post(rooturl + "/gettraderecords" , {} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				if(resp.accountLogVoList==undefined){
					$.toast("没有交易记录" , 2000);
					
					return false;
				}
					
				var records=resp.accountLogVoList;
				for(var i=0;i<records.length;i++){
					$(".deal_box_bottom").append("<div class=\"deal_box bottom record\"><div class=\"deal_box_time\"><div class=\"deal_box_time_label\"><span style=\"font-size: 34px;color: #494949;\">30</span><br><span style=\"font-size: 24px;\">12:23</span></div><div class=\"deal_box_time_img\"><img style=\"width:12px;height:140px;\" src=\"img/border.png\"></div></div><div class=\"deal_box_content\"><div class=\"deal_box_content_box\"><div class=\"deal_box_content_box_label\">操作金额："+records[i].money+"总金额："+records[i].totaly+"可用金额："+records[i].use_money+"冻结金额："+records[i].no_use_money+"代收金额："+records[i].collection+"</div></div></div></div>");
				}
			}else{
				$.toast(resp.mess , 2000);
			}
		})
		
		
	}
	
	</script>
</html>