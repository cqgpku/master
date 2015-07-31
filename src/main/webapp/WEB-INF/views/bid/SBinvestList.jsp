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
		<title>散标专区</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<link rel="stylesheet" href="<%=path%>/css/pluginstyle.css">
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body style="background: #fff;">
		<div class="targetCustomer_top">
		<div class="targetCustomer_top top1">
		<div class="dropdown" style="width:24.5%;float:left;">
      <select id="borrowType" name="borrowType" class="dropdown-select" onchange="init();">
        <option value="100" selected>类型</option>
        <option value="103">抵押标</option>
        <option value="102">信用标</option>
        <option value="104">净值标</option>
        <option value="110">流转标</option>
        <option value="101">秒还标</option>
        <option value="112">担保标</option>
      </select>
    </div>
    <div class="dropdown" style="width:24.5%;float:left;">
      <select id="time_limit" name="time_limit" class="dropdown-select" onchange="init();">
        <option value="all" seclected>期限</option>
        <option value="0-1">0-30天</option>
        <option value="1-2">30-60天</option>
        <option value="2-3">60-90天</option>
        <option value="3-6">90-180天</option>
        <option value="6">180天以上</option>
      </select>
    </div>
    <div class="dropdown" style="width:24.5%;float:left;">
      <select id="apr" name="apr" class="dropdown-select" onchange="init();">
        <option value="all" selected>利率</option>
        <option value="0-6">0-6%</option>
        <option value="6-7">6-7%</option>
        <option value="7">7%以上</option>
      </select>
    </div>
    <div class="dropdown" style="width:24.5%;float:left;">
      <select id="account" name="account" class="dropdown-select" onchange="init();">
        <option value="all" selected>总额</option>
        <option value="5">5万以下</option>
        <option value="5-10">5-10万</option>
        <option value="10-20">10-20万</option>
        <option value="20-30">20-30万</option>
        <option value="30">30万以上</option>
      </select>
    </div>
		</div>
		<div class="targetCustomer_top middle">
		<label ></label>
		</div>
		</div>
		
		<div class="targetCustomer_middle">
		<div class="targetCustomer_middle box">
		<div class="targetCustomer_middle box left">
		<div style="height:140px;border-bottom: 1px solid #cccccc;line-height: 30px;">
		<div style="height:60px;line-height: 60px;">
		<label style="font-size: 24px;color:#494949;">信用标&nbsp;<span style="background: #25c3da;border-radius: 5px;font-size: 20px;color:#cccccc;">期限3个月</span></label>
		</div>
		<div style="height:80px;line-height: 30px;"><label style="color: #25c3da;font-size:28px;float:left;">11.00% &nbsp;&nbsp;</label><label style="color: #494949;font-size:28px;float:center;">300,000.00</label><br>
		<label style="float:left;">年化收益 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label><label style="float:center;">融资总额（元）</label>
		</div>
		</div>
		<div style="height:60px;line-height: 60px;"><label>湖南中与投资担保有限公司担保</label></div>
		</div>
		<div class="targetCustomer_middle box right"></div>
		</div>
		
		<div class="targetCustomer_middle box">
		<div class="targetCustomer_middle box left">
		<div style="height:140px;border-bottom: 1px solid #cccccc;line-height: 30px;">
		<div style="height:60px;line-height: 60px;">
		<label style="font-size: 24px;color:#494949;"><img style="width:24px;height:24px;" src="<%=basePath%>/img/vip50.png">信用标&nbsp;<span style="background: #25c3da;border-radius: 5px;font-size: 20px;color:#cccccc;">期限3个月</span></label>
		</div>
		<div style="height:80px;line-height: 30px;"><label style="color: #25c3da;font-size:28px;float:left;">11.00% &nbsp;&nbsp;</label><label style="color: #494949;font-size:28px;float:center;">300,000.00</label><br>
		<label style="float:left;">年化收益 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label><label style="float:center;">融资总额（元）</label>
		</div>
		</div>
		<div style="height:60px;line-height: 60px;"><label>湖南中与投资担保有限公司担保</label></div>
		</div>
		<div class="targetCustomer_middle box right"></div>
		</div>
		
		</div>
		
		
	</body>
	<script>
	init();

	function init(){
		$(".targetCustomer_middle").empty();
		var areaType="3";//散标专区
		var pageNo="1";
		var pageSize="10";
		var status="14";
		var borrowType=$("#borrowType").val();
		var time_limit=$("#time_limit").val();
		var apr=$("#apr").val();
		var account=$("#account").val();
		$.post(rooturl + "/getinvestlist" , {areaType:areaType,pageNo:pageNo,pageSize:pageSize,status:status,borrowType:borrowType,time_limit:time_limit,apr:apr,account:account} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				//加载投资列表信息
				
				var invests=resp.jwzqInvestList;
				var html="";
				for(var i=0;i<invests.length;i++){
					html+="<div class=\"targetCustomer_middle box\"  onclick=\"window.location.href='"+rooturl+"bidinfo/"+invests[i].investId+"'\"><div class=\"targetCustomer_middle box left\"><div style=\"height:140px;border-bottom: 1px solid #cccccc;line-height: 30px;\"><div style=\"height:60px;line-height: 60px;\"><label style=\"font-size: 24px;color:#494949;\">"+invests[i].title+"&nbsp;<span style=\"background: #25c3da;border-radius: 5px;font-size: 20px;color:#cccccc;\">期限"+invests[i].term+(invests[i].termType=="0"?"个月":"天")+"</span></label></div><div style=\"height:80px;line-height: 30px;\"><label style=\"color: #25c3da;font-size:28px;float:left;\">"+invests[i].rate+" &nbsp;&nbsp;</label><label style=\"color: #494949;font-size:28px;float:center;\">"+invests[i].totalNum+"</label><br><label style=\"float:left;\">年化收益 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label><label style=\"float:center;\">融资总额（元）</label></div></div><div style=\"height:60px;line-height: 60px;\"><label>"+invests[i].guarantee_corporation+"</label></div></div><div class=\""+(invests[i].percentage=="1"?"targetCustomer_middle box rightdone":"targetCustomer_middle box right")+"\"></div></div>";
				}
				$(".targetCustomer_middle").append(html);
			}
		})
		
		
	}
	
	
	function checkchange(){
		
	}
	</script>
</html>