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
		<title>添加银行卡</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="<%=path%>/css/reset.css">
		<link rel="stylesheet" href="<%=path%>/css/style.css">
		<link rel="stylesheet" href="<%=path%>/css/pluginstyle.css">
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		
		<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		<!-- <link rel="stylesheet" href="/css/reset.css">
		<link rel="stylesheet" href="/css/style.css"> -->
		<script>
			var rooturl = "<%=basePath%>";
		</script>
	</head>
	<body style="background: #eeeeee;">
		
		
		<div class="addbank_middle">
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>银行卡类型：</label>
		</div>
		<div class="addbank_middle box right">
		借记卡</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>真实姓名：</label>
		</div>
		<div class="addbank_middle box right">${realname}</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>身份证号：</label>
		</div>
		<div class="addbank_middle box right">${cardid}</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>开户行：</label>
		</div>
		<div class="addbank_middle box right">
		<div class="dropdown">
      <select id="one" name="one" class="dropdown-select">
        <option value="">请选择开户行…</option>
      </select>
    </div>
		<!-- <input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入开户行"  maxlength="20"> -->
		</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>开户地区：</label>
		</div>
		<div class="addbank_middle box right">
		<div class="dropdown" style="width:150px;float:left;">
      <select id="area" name="area" class="dropdown-select" onchange="provincechange();">
        <option value="">请选择省…</option>
      </select>
    </div>
    <div class="dropdown" style="width:150px;float:left;">
      <select id="city" name="city" class="dropdown-select" onchange="citychange();">
        <option value="">请选择市…</option>
      </select>
    </div>
    <div class="dropdown" style="width:150px;float:left;">
      <select id="zone" name="zone" class="dropdown-select" onchange="bankchange();">
        <option value="">请选择区…</option>
      </select>
    </div>
		<!-- <input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入开户地区"  maxlength="20"> -->
		</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>支行名称：</label>
		</div>
		<div class="addbank_middle box right">
		<div class="dropdown">
      <select id="bankbranch" name="bankbranch" class="dropdown-select">
        <option value="">请选择支行..</option>
      </select>
    </div>
		<!-- <input style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入支行名称"  maxlength="20"> -->
		</div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>银行账号：</label>
		</div>
		<div class="addbank_middle box right"><input id="cardid" style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入银行账号"  ></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>手机号码：</label>
		</div>
		<div class="addbank_middle box right"><input class="addbankphone" style="width:100%;height:88px;font-size:28px;  type="text" placeholder="请输入手机号"  maxlength="20"></div>
		</div>
		
		<div class="addbank_middle box">
		<div class="addbank_middle box left">
		<label>验证码：</label>
		</div>
		<div class="addbank_middle box right" ><input id="codeid" style="width:180px;height:88px;font-size:28px;  type="text" placeholder="请输入验证码"  maxlength="20">
		<input class="btn_getaddbankcode" style="width:180px;height:100px;font-size:28px;color:#25c3da;float:right;line-height: 100px;cursor: pointer;" value="获取验证码" ></div>
		</div>
		
		</div>
		
		<div class="addbank_bottom" onclick="addbank();">确认添加
		</div>
		<script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js?v=1"></script>
	</body>
		<script>
		init();
	function init(){
		//初始化银行下拉信息
		$.post(rooturl + "/getbanks" , {} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				//加载银行信息
				var banks=resp.bankData;
				for(var i=0;i<banks.length;i++){
					$("#one").append("<option value=\""+banks[i].id+"\">"+banks[i].name+"</option>");
				}
			}
			
			})
			
			//初始化地区下拉信息
		$.post(rooturl + "/getareas" , {areaid:"0"} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				//加载地区信息
				var areas=resp.areaData;
				for(var i=0;i<areas.length;i++){
					$("#area").append("<option value=\""+areas[i].id+"\">"+areas[i].name+"</option>");
				}
			}
			
			})
	}
	
	//开户行改变则重新加载支行信息
function bankchange(){
	var selectedbank=$("#one").val();
	var selectedprovince=$('#area').find("option:selected").text(); 
	var selectedcity=$('#city').find("option:selected").text();
	var selectedarea=$('#zone').find("option:selected").text();
	//初始化支行下拉信息
	$.post(rooturl + "/getbankbranchs" , {bank:selectedbank,province:selectedprovince,city:selectedcity,area:selectedarea} , function(resp){
		if(typeof(resp) != "object"){
			resp = JSON.parse(resp);
		}
		//$.toast(resp.mess , 2000);
		if(resp.result == "100"){
			//先清空支行信息
			$("#bankbranch").empty();
			$("#bankbranch").append("<option value=\"\">请选择支行..</option>");
			//加载银行信息
			var branchs=resp.branchs;
			for(var i=0;i<branchs.length;i++){
				$("#bankbranch").append("<option value=\""+branchs[i]+"\">"+branchs[i]+"</option>");
			}
		}
		
		})
}
	
	function provincechange(){
		var selectedid=$("#area").val();
		//初始化支行下拉信息
		$.post(rooturl + "/getareas" , {areaid:selectedid} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				//先清空支行信息
				$("#city").empty();
				$("#city").append("<option value=\"\">请选择市..</option>");
				//加载银行信息
				var areas=resp.areaData;
				for(var i=0;i<areas.length;i++){
					$("#city").append("<option value=\""+areas[i].id+"\">"+areas[i].name+"</option>");
				}
			}
			
			})
	}
	
	function citychange(){
		var selectedid=$("#city").val();
		//初始化支行下拉信息
		$.post(rooturl + "/getareas" , {areaid:selectedid} , function(resp){
			if(typeof(resp) != "object"){
				resp = JSON.parse(resp);
			}
			//$.toast(resp.mess , 2000);
			if(resp.result == "100"){
				//先清空支行信息
				$("#zone").empty();
				$("#zone").append("<option value=\"\">请选择区..</option>");
				//加载银行信息
				var areas=resp.areaData;
				for(var i=0;i<areas.length;i++){
					$("#zone").append("<option value=\""+areas[i].id+"\">"+areas[i].name+"</option>");
				}
			}
			
			})
	}
	
	function addbank(){
		//添加银行卡
			var bankid = $('#one').val();
			var cardid = $('#cardid').val();
			var provinceid = $('#area').val();
			var cityid = $('#city').val();
			var zoneid = $('#zone').val();
			var branchname = $('#bankbranch').find("option:selected").text(); 
			var codeid = $('#codeid').val();
			
			$.post(rooturl + "/addbank" , {cardNumber:cardid,openBank:bankid,province:provinceid,city:cityid,area:zoneid,branchName:branchname,codeNo:codeid} , function(resp){
				var result=eval('(' + resp + ')')
				if(result.code=="0")
				{
					$.toast('添加成功！' , 2000);
				}else{
					$.toast('添加失败！' , 2000);
				}
			})
		
	}
</script>
</html>