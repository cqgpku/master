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
		<title>标的详情</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		
		<link rel="stylesheet" href="<%=path%>/css/pluginstyle.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js?v=1"></script>
		
		<style type="text/css">
.divcss5_list_title{background:#eeeeee; border:1px solid #cccccc; padding:1em;}
.divcss5_list_content{padding:1em;}
#tinybox{position:absolute; display:none; padding:10px; background:#ffffff url(image/preload.gif) no-repeat 50% 50%; border:10px solid #e3e3e3; z-index:2000;}
#tinymask{position:absolute; display:none; top:0; left:0; height:100%; width:100%; background:#000000; z-index:1500;}
#tinycontent{background:#ffffff; font-size:1.1em;}

#n{margin:10px auto; width:920px; border:1px solid #CCC;font-size:12px; line-height:30px;}
#n a{ padding:0 4px; color:#333}
</style>

		<script type="text/javascript" src="<%=path%>/js/tinybox.js"></script>
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body style="background: #fff;">
	<input type="hidden" id="investid" value="" >
	<input type="hidden" id="type" value="" >
	<input type="hidden" id="termType" value="" >
	<input type="hidden" id="borrowpwd" value="" >
		<div class="bid_top">
		
		<div class="bid_top top">
		<label style="float:left;"></label>
		<label style="float: center;">标的详情</label>
		</div>
		<div class="bid_top middle">
		<strong><label id="title" style="margin-left: 30px;float:left;">中国移动供应商贷款</label></strong>
		</div>
		<div class="bid_top bottom">
				<div class="bid_top_bottom_label">
		<label id="time">剩余时间：--</label>
		<label style="float: right;" id="pect">40%</label>
		</div>
		<div class="bid_top_bottom_label">
		<img style="width:100%;height:30px;"  src="">
		</div>
		
		</div>
		</div>
		
		
		<div class="bid_middle_1">
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;" id="rate">10.50</span>%</label><br>
		<label>年化利率</label>
		</div>
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;" id="term">2</span><span id="termlabel">个月</span></label><br>
		<label >投资期限</label>
		</div>
		<div class="bid_middle_1 box">
		<label style="font-size:24px;color:#494949;"><span style="font-size: 40px;" id="totalNum">200,000</span>元</label><br>
		<label >融资总额</label>		
		</div>
		</div>
		<div class="bid_middle_2">
		<label style="font-size:28px;color:#989898;">剩余投资金额：<span style="color: #25c3da;" id="remainNum">		80,000</span></label><br>
		<label style="font-size:24px;color:#989898;">担保公司：<span style="color: #25c3da;" id="guaranteeCompany">湖南中与投资担保有限公司</span></label><br>
		<label style="font-size:24px;color:#989898;">还款方式：<span style="color: #25c3da;" id="returnType">按月分期还款</span></label><br>
		<label>本息保障	灵活转让</label>
		</div>
		
		<div class="bid_middle_3">
		<div class="bid_middle_3 tab">
		<div id="bid_middle_3_tab_tab1" class="bid_middle_3_tab_tab1" onclick="investRecord('tab1');">借款质押物</div>
		<div id="bid_middle_3_tab_tab2" class="bid_middle_3_tab_tab2" onclick="investRecord('tab2');">投标记录</div>
		</div>
		
		<div class="bid_middle_3 page" id="description">
		<div class="bid_middle_3_page_box">
		<label style="width:30%;float:left;">1****</label>
		<label style="width:30%;float:left;">500.01</label>
		<label style="width:30%;float:left;">500.01</label>
		<label style="width:30%;float:left;">2015-07-30 09:46:34</label>
		</div>
		</div>
		
		</div>
		
		<div id="bid_hidden" class="bid_hidden" >
		<div class="bid_hidden_top">
		<label>剩余投资金额（元）：<span style="color: #25c3da;" id="remainNum1">55493054.00</span></label><br>
		<label>最多投标金额（元）：无限制</label><br>
		<label>我的账户金额（元）：<span style="color: #25c3da;" id="availableAmount">100.00</span></label>
		</div>
		<div class="bid_hidden_middle">
		<label>投资金额（元）：</label>
		
		<img src="<%=basePath%>img/13.png" style="width:60px;height:60px;" onclick="submoney();">&nbsp;
		<input id="investmoney" style="width:150px;height:60px;font-size:28px;border: 1px solid #25c3da;"  type="text" value="100" readonly="true" >
		&nbsp;
		<img src="<%=basePath%>img/14.png" style="width:60px;height:60px;" onclick="addmoney();"></span>
		
		</div>
		<div class="bid_hidden_middle">
		<label>到期预计可获本息（元）：<span style="color: #25c3da;" id="interest"></span></label>
		</div>

		<div id="bid_hidden_middle_button" class="bid_hidden_middle_button" onclick="investmoney();">立即投资
		</div>
		
		</div>
		
		
		<div id="hidden_pwd" class="hidden_pwd">
		<div class="hidden_pwd_box">
		<div class="hidden_pwd_text"><input id="payPassword" style="width:90%;height:78px;margin-top:30px;font-size:28px; border:1px solid #25c3da;border-radius: 5px;" type="text" placeholder="请输入交易密码"  maxlength="11"></div>
		<div class="hidden_pwd_text"><input id="borrowpayPassword" style="width:90%;height:78px;font-size:28px; border:1px solid #25c3da;border-radius: 5px;" type="text" placeholder="请输入定向密码，无则不填"  maxlength="11"></div>
		<div class="hidden_pwd_button">
		<div class="hidden_pwd_button_box">
		<div class="hidden_pwd_button_box1" style="background-color: #cccccc;" onclick="cancelpwd();">
		取消
		</div>
		<div class="hidden_pwd_button_box2" onclick="investpay();">
		确定
		</div>
		</div>
		</div>
		</div>
		</div>
		
		<div id="bid_bottom" class="bid_bottom" onclick="invest();">立即投资
		</div>
		<div id="ly" class="ly" ></div>
		<div id="ly1" class="ly1" ></div>
	</body> 
	<script>
	
	//	var info1="{status=7, code=100, mess=请求成功！, repayment_time=2015-08-22, returnType=按月付息到期还本, remainNum=0, totalNum=300000, title=信用标, rate=11, termType=0, valid_time=691200, term=3, investId=893, guaranteeCompany=湖南中御投资担保有限公司}";
	var info="${info.title}";

	init();
	
	function init(){
		$("#investid").val("${info.investId}");
		$("#termType").val("${info.termType}");
		$("#borrowpwd").val("${info.pwd}");
		
		$("#title").html("${info.title}");
		$("#rate").html("${info.rate}");
		$("#term").html("${info.term}");
		$("#totalNum").html("${info.totalNum}");
		$("#remainNum").html("${info.remainNum}");
		$("#remainNum1").html("${info.remainNum}");
		$("#guaranteeCompany").html("${info.guaranteeCompany}");
		$("#returnType").html("${info.returnType}");
		$("#description").html("${info.description}");
		var ter="${info.termType}";
		if(ter=="0")
			$("#termlabel").html("个月");
		else
			$("#termlabel").html("天");
		if("${info.buylimit}"=="0"){
			$("#bid_bottom").css("background-color", "#cccccc");
			$("#bid_bottom").html("不可抢购");
		}
			
	}
	
	function invest(){
		if("${info.buylimit}"=="0")
			return false;
		//初始化投资金额个人信息界面
		$.post(rooturl + "/getmyaccountinfo" , {} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			if(resp.code == "100"){
				$("#availableAmount").html(resp.availableAmount);
			}else{
				$.toast(resp.mess , 2000);
			}
			
			})
		
	    $("#ly").fadeIn(200);
	 	$("#bid_hidden").fadeIn(200);
		
	 	$("#bid_bottom").css("display","none");
	 	/* popup($("#hidden_pwd")); 
	 	$("#ly").fadeIn(200); */
	}
	
	function investmoney(){
		
 		$("#hidden_pwd").fadeIn(200);
 		$("#ly").fadeIn(200);
    	$("#ly1").fadeIn(200);
	}
	
	function popup(popupName){ 
		var _scrollHeight = $(document).scrollTop(),//获取当前窗口距离页面顶部高度 
		_windowHeight = $(window).height(),//获取当前窗口高度 
		_windowWidth = $(window).width(),//获取当前窗口宽度 
		_popupHeight = popupName.height(),//获取弹出层高度 
		_popupWeight = popupName.width();//获取弹出层宽度 
		_posiTop = (_windowHeight - _popupHeight)/2 + _scrollHeight; 
		_posiLeft = (_windowWidth - _popupWeight)/2; 
		popupName.css({"left": _posiLeft + "px","top":_posiTop + "px","display":"block"});//设置position 
		} 
	
	function submoney(){
		var money=$("#investmoney").val();
		var newmoney;
		if(parseInt(money)==parseInt(100)){
			$.toast('不能低于100元！' , 2000);
			newmoney=parseInt(money); 
		}else{
			newmoney=parseInt(money)-parseInt(100); 
		}
		$("#investmoney").val(newmoney);
		calculateInterest();
	}
	
	function addmoney(){
		var money=$("#investmoney").val();
		var newmoney;
		newmoney=parseInt(money)+parseInt(100); 
		$("#investmoney").val(newmoney);
		calculateInterest();
	}
	
	function investpay(){
		var flag=true;
		var investId = $('#investid').val();
		var money = $('#investmoney').val();
		var payPassword = $('#payPassword').val();
		var borrowPayPassword = $('#borrowpayPassword').val();
		if($('#borrowpwd').val()!=""){
			if($('#borrowpwd').val()!=borrowPayPassword){
				$.toast('定向交易密码不正确！' , 2000);
				flag=false;
			}else{
				flag=true;
			}
		}
		if(borrowPayPassword==null)
			borrowPayPassword="";
		$.post(rooturl + "/investtender" , {investId:investId,money:money,payPassword:payPassword,city:cityid,area:zoneid,branchName:branchname,codeNo:codeid} , function(resp){
			var result=eval('(' + resp + ')')
			if(result.code=="0")
			{
				$.toast('投资成功！' , 2000);
			}else{
				$.toast('投资失败！' , 2000);
			}
		})
	}
	
	function cancelpwd(){
		$("#ly1").fadeOut(200);
    	$("#ly").fadeIn(200);
 		$("#hidden_pwd").fadeOut(200);
	}
	
	//计算利息
	function calculateInterest(){
		var ter="${info.termType}";
		var interest;
		var investmoney=$('#investmoney').val();
		var rate="${info.rate}";
		var term="${info.term}";
		if(ter=="0"){
			//本息=投资金额*(1+年化利率/1200*期限)；
			interest=parseFloat(investmoney)*(parseFloat(1)+parseFloat(rate)/parseFloat(1200)*parseFloat(term)); 
		}else{
			//本息=投资金额*期限*年化利率/36000+投资金额
			interest=parseFloat(investmoney)*parseFloat(term)*parseFloat(rate)/36000+parseFloat(investmoney);
		}
		$("#interest").html(interest.toFixed(2));
	}
	
	$(document).ready(
			function() {
				//更新剩余时间
				//status=1时才计算时间 
				if("${info.status}"=="1")
				{
					var maxtime="${info.valid_time}";
					var begintime="${info.last_time}";
					var dt=new Date();
					var curtime=dt.getTime();
					var time=Math.floor(curtime-begintime*1000);
					var flag=Math.floor(maxtime-time/1000);
					if(flag<0){
						var span_timer = document.getElementById("time");
						span_timer.innerHTML = "剩余时间：无，已结束";
					}else{
						var days = Math.floor(flag/86400); 
						var hours = Math.floor((flag%86400)/3600); 
						var minutes = Math.floor(((flag%86400)%3600)/60);  
						var seconds = Math.floor(((flag%86400)%3600)%60);
						var span_timer = document.getElementById("time");
						span_timer.innerHTML = "剩余时间："+days+"天"+hours+"小时"+minutes+"分钟"+seconds+"秒";
						var timer = setInterval(function() {
							if (flag <= 0) {
								
								clearInterval(timer);
								timer = 0;
							} else {
								days = Math.floor(flag/86400); 
								hours = Math.floor((flag%86400)/3600); 
								minutes = Math.floor(((flag%86400)%3600)/60);  
								seconds = Math.floor(((flag%86400)%3600)%60);
								span_timer.innerHTML = "剩余时间："+days+"天"+hours+"小时"+minutes+"分钟"+seconds+"秒";
								flag--;
							}
						}, 1000);
					}
					
				}
				else if("${info.status}"=="8")
				{
					var span_timer = document.getElementById("time");
					span_timer.innerHTML = "剩余时间：无，已还款";
				}else{
					var span_timer = document.getElementById("time");
					span_timer.innerHTML = "剩余时间：无，已售罄";
				}
				
		
		//更新投资金额百分比
		var summoney="${info.totalNum}";
		var remainmoney="${info.remainNum}";
		var pect=((parseFloat(summoney)-parseFloat(remainmoney))/parseFloat(summoney)).toFixed(4)*100+"%";
		$("#pect").html(pect);
			});
	
	function investRecord(str){
		if(str=="tab1"){
			$("#bid_middle_3_tab_tab2").attr("class", "bid_middle_3_tab_tab2"); 
			$("#bid_middle_3_tab_tab1").attr("class", "bid_middle_3_tab_tab1"); 
			$("#description").empty();
			$("#description").append("${info.description}");
		}else{
			$("#bid_middle_3_tab_tab2").attr("class", "bid_middle_3_tab_tab1"); 
			$("#bid_middle_3_tab_tab1").attr("class", "bid_middle_3_tab_tab2"); 
			var investId="${info.investId}";
			$.post(rooturl + "/getvipinvestrecords" , {investId:investId} , function(resp){
				if(typeof(resp) != "object"){
					resp = JSON.parse(resp);
				}
				if(resp.result == "100")
				{
					$("#description").empty();
					//加载信息
					$("#description").append("<div class=\"bid_middle_3_page_box\" style=\"height:60px;\"><label style=\"width:28%;float:left;height:60px;line-height:60px;\">投资用户</label><label style=\"width:28%;float:left;height:60px;line-height:60px;\">投资金额（元）</label><label style=\"width:28%;float:left;height:60px;line-height:60px;\">审核时间</label></div>");
					var records=resp.vipBorrowOrderList;
					for(var i=0;i<records.length;i++){
						$("#description").append("<div class=\"bid_middle_3_page_box\"><label>"+records[i].username+"</label><label>"+records[i].money+"</label><label>"+records[i].verify_time+"</label><br><label style=\"width:100%;text-align:left;\">"+records[i].order_time+"</label></div>");
					}
				}else{
					$.toast('获取投标记录失败！' , 2000);
				}
			})
		}
		
		
		
	}
	</script>
</html>