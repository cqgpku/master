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
		<title>银行卡列表</title>
    <link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
    <script>
			var rooturl = "<%=basePath%>";
		</script>
</head>
<body  style="background: #eeeeee;">
<div class="bankcard_top">
		<label style="float:left;margin-left:15px;"><</label>
		<label style="float: center;">银行卡</label>
		<label style="float:right;margin-right:15px;"><span onclick="addbank();">+</span></label>
</div>
<div class="bankcard_middle">
 
<!-- <div class="bankcard_middle_box">
<div class="bankcard_middle_box_label" id="bank1" onclick="showdelete(this);">
	<label >交通银行北京海淀支行</label><br>
	<label style="color:#cccccc;">尾号0909</label>
	</div>
	<div class="bankcard_middle_box_delete" id="bank1delete" onclick="deletebank(this);">删除</div>
</div> -->
</div>
		
</body>
<script>
init();

	function init(){
		$.post(rooturl + "/getbindcards" , {} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				//加载地区信息
				var banks=resp.bankData;
				for(var i=0;i<banks.length;i++){
					var cardid=banks[i].bankaccount;
					cardid=cardid.substr(cardid.length-4);
					$(".bankcard_middle").append("<div class=\"bankcard_middle_box\"><div class=\"bankcard_middle_box_label\" id=\""+banks[i].bankId+"\" onclick=\"showdelete(this);\"><label >"+banks[i].branch+"</label><br><label style=\"color:#cccccc;\">尾号"+cardid+"</label></div><div class=\"bankcard_middle_box_delete\" id=\""+banks[i].bankId+"del\" onclick=\"deletebank(this);\">删除</div></div>");
				}
			}
		})
		
		
	}
	
	function showdelete(obj){
		$("#"+obj.id).css("margin-left","-150px");
		$("#"+obj.id+"del").css({"margin-right":"0","display":"block"});
	}
	
	function deletebank(obj){
	//	alert("删除"+obj.id);
		//删除银行卡
		var bankid = obj.id.substring(0,str.length-3);;
		
		$.post(rooturl + "/deletebank" , {bankId:bankid} , function(resp){
			var result=eval('(' + resp + ')')
			if(result.code=="0")
			{
				$.toast('删除成功！' , 2000);
				window.location.reload();
			}else{
				$.toast('删除失败失败！' , 2000);
			}
		})
	}
	
	function addbank(){
		window.location.href=rooturl + "/addbankcard";
	}
</script>
</html>
