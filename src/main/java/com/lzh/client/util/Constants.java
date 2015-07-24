package com.lzh.client.util;

public class Constants {
	public static String appid = "wx447db6968c4c80d2";
	public static String appsecret = "8e44e37b7325cb35f1227c048cb56d97";
	
	public static String appid_test = "wx137e53a661898be0";
	public static String appsecret_test = "60866ee306aa47a74fe8ce9628e27ffe";
	
	public static String wfpath = "/opt/cqg/";
	
	public static String registurl = "http://www.cqg365.com/p2p/app/register.html";
	public static String identifyurl = "http://www.cqg365.com/p2p/app/sendPhoneCode.html";
	public static String passwordreplacerul = "http://www.cqg365.com/p2p/app/resetPass.html";
	public static String loginurl = "http://www.cqg365.com/p2p/app/login.html";
	public static String codeurl = "http://www.cqg365.com/p2p/app/sendPhoneCodeRegister.html";
	public static String existurl = "http://www.cqg365.com/p2p/app/validateUser.html";
	/*
	 * 首页接口
	 * 示例：http://pay.cqg365.com/p2p/app/homePage.html?apiLevel=1
	 * 返回值：result：100表示成功，其他表示失败；resultDesc：描述返回状态；headImgList：首页轮播图列表
	 */
	public static String homepageurl = "http://pay.cqg365.com/p2p/app/homePage.html";
	
	/*
	 * 投标接口
	 * 示例：http://pay.cqg365.com/p2p/app/tender.html?investId=xxx&money=xxx&payPassword=xxxx&borrowPayPassword=xxx
	 * 参数：apiLevel：当前版本；investId：投标id；money：投标金额；payPassword：支付密码；borrowPayPassword：标的定向交易密码
	 */
	public static String tenderurl = "http://pay.cqg365.com/p2p/app/tender.html";
	
	/*
	 * 绝味专区接口
	 * 示例：http://pay.cqg365.com/p2p/app/getInvestListByArea.html?areaType=3&pageNo=1&pageSize=10&status=14&borrowType=100&time_limit=all&apr=all&account=all
	 * 参数：见文档
	 */
	public static String investlisturl = "http://pay.cqg365.com/p2p/app/getInvestListByArea.html";
	
	/*
	 * 标的详情接口
	 * 示例：http://pay.cqg365.com/p2p/app/investDetail.html?apiLevel=1&investId=xxx
	 * 参数：见文档
	 */
	public static String investdetailurl = "http://pay.cqg365.com/p2p/app/investDetail.html";
	
	/*
	 * 标的详情-投标记录查询接口
	 * 示例：http://pay.cqg365.com/p2p/app/investHistoryList.html?apiLevel=1& investId=xxxx&pageNo=xx&pageSize=xxx
	 * 参数：见文档
	 */
	public static String investhistorylisturl = "http://pay.cqg365.com/p2p/app/investHistoryList.html";
	
	/*
	 * 用户检索个人投标记录接口
	 * 示例：http://pay.cqg365.com/p2p/app/userInvestHistoryList.html?apiLevel=1& pageNo=xxx&pageSize=xxx
	 * 参数：见文档
	 */
	public static String userinvesthistorylisturl = "http://pay.cqg365.com/p2p/app/userInvestHistoryList.html";
	
	/*
	 * 发送短信验证码注册接口
	 * 示例：http://pay.cqg365.com/p2p/app/sendPhoneCodeRegister.html?phoneNo=13800138000
	 * 参数：见文档
	 */
	public static String sendphonecoderegisterurl = "http://pay.cqg365.com/p2p/app/sendPhoneCodeRegister.html";
	
	/*
	 * 绑定邮箱接口
	 * 示例：http://pay.cqg365.com/app/email.html?user_id=15101&email=123456@qq.com
	 * 参数：见文档
	 */
	public static String emailurl = "http://pay.cqg365.com/p2p/app/email.html";
	
	/*
	 * 发送短信验证码找回交易密码
	 * 示例：http://pay.cqg365.com/p2p/app/sendCodeGetPayPwd.html
	 * 参数：见文档
	 */
	public static String sendcodegetpaypwdurl = "http://pay.cqg365.com/p2p/app/sendCodeGetPayPwd.html";
	
	/*
	 * 找回交易密码功能
	 * 示例：http://pay.cqg365.com/p2p/app/getPayPwd.html?phone=15101366931&phonevcode=1234&newPayPassword=xxx
	 * 参数：见文档
	 */
	public static String getpaypwdurl = "http://pay.cqg365.com/p2p/app/getPayPwd.html";
	
	/*
	 * 发送短信验证码找回登录密码功能
	 * 示例：http://pay.cqg365.com/p2p/app/sendCodeGetPwd.html?phone=15101366931
	 * 参数：见文档
	 */
	public static String sendcodegetpwdurl = "http://pay.cqg365.com/p2p/app/sendCodeGetPwd.html";
	
	/*
	 * 找回登录密码功能
	 * 示例：http://pay.cqg365.com/p2p/app/getPwd.html?phone=15101366931&phonevcode=1234&newPassword=xxx
	 * 参数：见文档
	 */
	public static String getpwdurl = "http://pay.cqg365.com/p2p/app/getPwd.html";
	
	/*
	 * 修改登录密码功能
	 * 示例：http://pay.cqg365.com/p2p/app/changePwd.html?oldPassword=1234&newPassword=12356
	 * 参数：见文档
	 */
	public static String changepwdurl = "http://pay.cqg365.com/p2p/app/changePwd.html";
	
	/*
	 * 修改交易密码功能
	 * 示例：http://pay.cqg365.com/p2p/app/changePayPwd.html?oldPayPassword=1234&newPayPassword=12356
	 * 参数：见文档
	 */
	public static String changepaypwdurl = "http://pay.cqg365.com/p2p/app/changePayPwd.html";
	
	/*
	 * 验证用户昵称/手机号是否存在接口
	 * 示例：http://pay.cqg365.com/p2p/app/validateUser.html?apiLevel=1&telNo=18810572587&checkCode=222222
	 * 参数：见文档
	 */
	public static String validateuserurl = "http://pay.cqg365.com/p2p/app/validateUser.html";
	
	/*
	 * 实名认证接口
	 * 示例：http://pay.cqg365.com/p2p/app/realNameAuthentication.html?apiLevel=1&user_id=12866&realName=庄国帅&idNumber=140203198912134654
	 * 参数：见文档
	 */
	public static String authenticationurl = "http://pay.cqg365.com/p2p/app/ realNameAuthentication.html";
	
	/*
	 * 账户信息接口
	 * 示例：http://pay.cqg365.com/p2p/app/userInfo.html
	 * 参数：见文档
	 */
	public static String userinfourl = "http://pay.cqg365.com/p2p/app/userInfo.html";
	
	/*
	 * 添加银行卡（提现银行卡）接口
	 * 示例：http://pay.cqg365.com/p2p/app/addBank.html?cardNumber=6222340017908962&openBank=1&branchName=2&province=3&city=1&area=2&codeNo=xxx
	 * 参数：见文档
	 */
	public static String addbankurl = "http://pay.cqg365.com/p2p/app/addBank.html";
	
	/*
	 * 删除银行卡（提现银行卡）接口
	 * 示例：http://pay.cqg365.com/p2p/app/deleteBank.html?apiLevel=1&bankId=295
	 * 参数：见文档
	 */
	public static String deletebankurl = "http://pay.cqg365.com/p2p/app/ deleteBank.html";
	
	/*
	 * 储钱罐app获取地区信息接口
	 * 示例：http://pay.cqg365.com/p2p/app/showarea.html?apiLevel=1&pid=1
	 * 参数：见文档
	 */
	public static String showareaurl = "http://pay.cqg365.com/p2p/app/showarea.html";
	
	/*
	 * 获取一级银行信息接口
	 * 示例：http://pay.cqg365.com/p2p/app/getBankData.html
	 * 参数：见文档
	 */
	public static String getbankdataurl = "http://pay.cqg365.com/p2p/app/getBankData.html";
	
	/*
	 * 储钱罐app获取用户银行卡获取支行信息接口
	 * 示例：http://pay.cqg365.com/p2p/app/getBranchs.html?bank=301&province=北京&city=北京市&area=西城区
	 * 参数：见文档
	 */
	public static String getbranchsurl = "http://pay.cqg365.com/p2p/app/getBranchs.html";
	
	/*
	 * 储钱罐app获取用户银行卡接口
	 * 示例：http://pay.cqg365.com/p2p/app/getAccount.html
	 * 参数：见文档
	 */
	public static String getaccountbankurl = "http://pay.cqg365.com/p2p/app/getAccount.html";
	
	/*
	 * 查询用户绑卡信息（一键支付银行卡）
	 * 示例：http://pay.cqg365.com/p2p/app/queryBindList.html
	 * 参数：见文档
	 */
	public static String querybindlisturl = "http://pay.cqg365.com/p2p/app/queryBindList.html";
	
	/*
	 * 删除银行卡，解绑卡（一键支付银行卡）接口
	 * 示例：http://pay.cqg365.com/p2p/app/unbindBankCard.html?apiLevel=1&bindid=xxx
	 * 参数：见文档
	 */
	public static String unbindbankurl = "http://pay.cqg365.com/p2p/app/unbind.html";
	
	/*
	 * 一键支付-移动端支付接口
	 * 示例：http://pay.cqg365.com/p2p/app/mobilePay.htmll?apiLevel=1&money=xxx&fcallbackurl=xxx&callbackurl =xx
	 * 参数：见文档
	 */
	public static String mobilebankurl = "http://pay.cqg365.com/p2p/app/mobilePay.html";
	
	/*
	 * 一键支付-移动端支付回调
	 * 示例：http://pay.cqg365.com/p2p/app/auditRecharge.htmll?apiLevel=1& trade_no=xxx&controlFlag=xxx
	 * 参数：见文档
	 */
	public static String auditrechargeurl = "http://pay.cqg365.com/p2p/app/auditRecharge.html";
	
	/*
	 * 提现接口
	 * 示例：http://pay.cqg365.com/p2p/app/charge.htmll?apiLevel=1&drawInCardNumber =xxx&payPassword=xxx&drawAmount=xx
	 * 参数：见文档
	 */
	public static String drawmoneyurl = "http://pay.cqg365.com/p2p/app/drawCash.html";
	
	/*
	 * 退出登录接口
	 * 示例：http://pay.cqg365.com/p2p/app/logout.html
	 * 参数：见文档
	 */
	public static String loginouturl = "http://pay.cqg365.com/p2p/app/logout.html";
	
	/*
	 * 交易记录详情接口
	 * 示例：http://pay.cqg365.com/p2p/app/tradeRecordList.html?pageNo=1&pageSize=5
	 * 参数：见文档
	 */
	public static String traderecordlisturl = "http://pay.cqg365.com/p2p/app/ tradeRecordList.html";
	
	/*
	 * 待收详情接口
	 * 示例：http://pay.cqg365.com/p2p/app/getCollectDetails.html
	 * 参数：见文档
	 */
	public static String getcollectdetailsurl = "http://pay.cqg365.com/p2p/app/getCollectDetails.html";
	
	/*
	 * VIP标资列表接口
	 * 示例：http://pay.cqg365.com/p2p/app/getVipBorrowInfo.html
	 * 参数：见文档
	 */
	public static String getvipborrowinfourl = "http://pay.cqg365.com/p2p/app/getVipBorrowInfo.html";
	
	/*
	 * VIP标的详情接口
	 * 示例：http://pay.cqg365.com/p2p/app/getVipBorrowById.html?borrow_vip_id=103
	 * 参数：见文档
	 */
	public static String getvipborrowbyidurl = "http://pay.cqg365.com/p2p/app/getVipBorrowById.html";
	
	/*
	 * 获取VIP标的投资记录接口
	 * 示例：http://pay.cqg365.com/p2p/app/getVipBorrowOrderInfo.html?borrow_vip_id=103&pageNo=1&pageSize=5
	 * 参数：见文档
	 */
	public static String getvipborroworderinfourl = "http://pay.cqg365.com/p2p/app/getVipBorrowOrderInfo.html";
	
	/*
	 * 预约VIP标接口
	 * 示例：http://pay.cqg365.com/p2p/app/orderVipBorrow.html?user_id=550&borrow_vip_id=110&money=30000
	 * 参数：见文档
	 */
	public static String ordervipborrowurl = "http://pay.cqg365.com/p2p/app/orderVipBorrow.html";
	
	/*
	 * 添加银行卡（提现银行）-发送短信验证码接口
	 * 示例：http://pay.cqg365.com/p2p/app/sendPhoneCodeAddBank.html
	 * 参数：见文档
	 */
	public static String sendphonecodeaddbankurl = "http://pay.cqg365.com/p2p/app/sendPhoneCodeAddBank.html";
	
	
	
	/**验证码的最小值*/
	public static final int IDENTIFY_DOCE_MIN = 100000;
	
	/**验证码的变化区间*/
	public static final int IDENTIFY_DOCE_RANGE = 899999;
	
	
	public static final int apiLevel = 1;
	public static final String cookie_key = "cqg_lpc";
	public static final int EXP_ONEDAY = 24 * 60 * 60;
	/**cookies相关的数据*/
	public static final String cookie_name = "cqg_name";
	public static final String cookie_email = "cqg_email";
	public static final String cookie_realstatus = "cqg_realstatus";
	public static final String cookie_realname = "cqg_realname";
	public static final String cookie_phone = "cqg_phone";
	public static final String cookie_tradepwd = "cqg_tradepwd";
	public static final String cookie_username = "cqg_username";
}
