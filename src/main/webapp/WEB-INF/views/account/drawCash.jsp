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
		<title>提现</title>
    <link href="dist/css/normalize.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="dist/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/zepto.js"></script>
		<script type="text/javascript" src="<%=path%>/js/integra.js"></script>
    <script>
			var rooturl = "<%=basePath%>";
		</script>
</head>
<style>
    .cash{
        height:200px;
        font-size:22px;
        color:#ffffff;
        line-height: 60px;
        background-color: #25c3da;
    }
    .money{
        font-size: 60px;
    }
    #drawcashcard,.hintinfo{
        font-size:24px;
        color: #cccccc;
        margin-top: 10px;
    }
    .hintinfo
    {
        height: 50px;
    }
    .carddetail,.carddetails{
        font-size: 24px;
        color: #494949;
        margin-top: 15px;
        margin-bottom: 15px;
    }
    .leftmargin{
        margin-left: 30px;
    }
    .drawamount,.drawpassword{
        width: 100%;
        height: 88px;
        border: 1px solid #cccccc;
        font-size: 28px;
        color: #cccccc;
        outline: none;
    }
      .dialog{
			position: fixed;
			width: 270px;
			background-color: black;
			height: 34px;
			-webkit-border-radius: 5px;
			color: #fff;
			font-size: 13px;
			text-align: center;
			line-height: 34px;
}
		body div.btn_un{
			background-color:#ccc;
		}
</style>
<body style="">
<div class="dc">
    <div class="dc_before"></div>
    <h2 class="dc_topic">提现</h2>
</div>
<div>
    <div class="cash">
        <div style="text-align: center">
            <label class="leftmoney" style="">可用金额（元）</label>
            <div class="money" id="money"></div>
        </div>
    </div>
    <div class="bankinfo">
        <div class="leftmargin" id="drawcashcard">提现银行卡</div>
        <div class="carddetail leftmargin">
        <div class="carddetails"></div>
        
        </div>
        <div class="">
            <input class="drawamount" name="drawamount" style="text-indent: 30px" onfocus="" placeholder="请输入提现金额">
        </div>
        <div class="leftmargin hintinfo">实际到账：0元 本月您还可提现<span id="candraw"></span>元</div>
        <div>
            <input class="drawpassword" name="drawpassword" type="password" style="text-indent: 30px;" placeholder="请输入交易密码">
            <div class="be_sub be_input">
                <input class="be_submit" type="button" value="确认提交" onclick="draw()">
            </div>
        </div>
     </div>
  </div>

   <script type="text/javascript">
       init();
       var rootdomain = ${rootdomain};
       var rootdomain2 = ${rootdomain2};
       //var rootdomain3 = ${rootdomain3};
       function init(){
        // alert(rootdomain2.bankData[0].bankaccount);
         $.post(rooturl + "/drawCash" , {} , function(){
        	//alert(rootdomain2.bankData[0].bankaccount);
        	document.getElementById("money").innerHTML = rootdomain.availableAmount;
        	document.getElementById("candraw").innerHTML = rootdomain.availableAmount;
        	for(var i=0; i<rootdomain2.bankData.length; i++)
            {
	        	var bankname = rootdomain2.bankData[i].bankname;
	            var bankid = rootdomain2.bankData[i].bankId;
	            banknumber = rootdomain2.bankData[i].bankaccount;
	            var tailnumber = banknumber.substr(banknumber.length-4);
	            info = "<input  type=\"radio\" name=\"bankcard\" value=\""+ banknumber +"\">" +  "<span class=\"carddetail\">"
	            + bankname  + "&nbsp尾号" + tailnumber
	            + "</span><br>";   
	            $(".carddetails").append(info);
            }
        })
    }
 
        
       
        function draw()
        {
        //	var rootdomain3 = ${rootdomain3};
        	var drawAmount=$("input[name='drawamount']").val();
        	var payPassword=$("input[name='drawpassword']").val();
        	var temp = document.getElementsByName("bankcard");
        	var banknumber;
            for(var i=0;i<temp.length;i++) {
                 if (temp[i].checked) {
                    banknumber = temp[i].value;
                 }
             }
            if(!banknumber)
            {
            	$.toast('请选择银行卡' , 2000);
            }
            else
            {
	        	if(!drawAmount) 
	        	{
	        		$.toast('请输入取现金额' , 2000);
	        	}
	        	else
	        	{
	        		if(!payPassword)
	        		{
	        			$.toast('请输入交易密码' , 2000);
	        		}
	        		else
	        		{
	        			$.post(rooturl + "/drawCash2" , {drawAmount:drawAmount,payPassword:payPassword,banknumber:banknumber} , function(resp){
	        				if(typeof(resp) != "object"){
	        					resp = JSON.parse(resp);
	        				}
	        				if(resp.code=="0")
	        				{
	        					$.toast(resp.mess , 2000);
	        				}else{
	        					$.toast(resp.mess , 2000);
	        				}
	        			})
	        		}
        	     }
            }
        }

         
    </script>
</body>
</html>
