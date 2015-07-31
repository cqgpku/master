package com.lzh.client.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.client.util.AESUtil;
import com.lzh.client.util.Constants;
import com.lzh.client.util.HttpUtil;
import com.lzh.client.util.PhoneUtil;
import com.lzh.client.util.StringUtils;
import com.lzh.client.viewmodel.HeadImgVo;
import com.lzh.client.viewmodel.TradeRecord;

@Controller
public class AccountController extends BaseController{
	
	private static final Log log = LogFactory.getLog(AccountController.class);
	
	@RequestMapping(value="getcode")
	public @ResponseBody Map<String, String> getcode( Model model ) {
		String phone = getParameter("phone");
		Map<String, String> result = new HashMap<String, String>();
		result.put("code", "1");
		if (!PhoneUtil.isPhoneQualified(phone)) {
			result.put("mess", "请输入正确的手机号！");
			return result;
		}
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel + "");
		params.put("phoneNo", phone);
		try {
			String http_result = HttpUtil.httpPost(Constants.codeurl, params);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				result.put("code", "0");
				result.put("mess", "注册成功！");
				return result;
			}else {
				result.put("code", "1");
				result.put("mess", jo.getString("resultDesc"));
				return result;
			}
		} catch (Exception e) {
			log.info("请求发送验证码接口失败,error:"+e.getMessage());
			result.put("mess", "注册失败");
			return result;
		}
	}
	
	@RequestMapping(value="isexisted")
	public @ResponseBody Map<String, String> isexisted( Model model ) {
		String phone = getParameter("phone");
		Map<String, String> result = new HashMap<String, String>();
		result.put("code", "1");
		if (StringUtils.isBlank(phone)) {
			result.put("code", "0");
			return result;
		}
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel + "");
		params.put("userName", phone);
		try {
			String http_result = HttpUtil.httpPost(Constants.existurl, params);
			if("".equals(http_result)){
				result.put("code", "0");
				return result;
			}else{
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "0");
					return result;
				}else {
					result.put("code", "1");
					return result;
				}
			}
		} catch (Exception e) {
			log.info("请求验证接口失败,error:"+e.getMessage());
			return result;
		}
	}
	
	@RequestMapping(value = "register/page")
	public String register_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "regist";
	}
	
	@RequestMapping(value = "download")
	public void download_page(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException  {
		response.sendRedirect(Constants.locationUrl+"MoneyBox_debug_20150727.apk");
		//return "/MoneyBox_debug_20150727.apk";
	}
	
	@RequestMapping(value="register")
	public @ResponseBody Map<String, String> register( Model model ) {
		String phone = getParameter("phone");
		String password = getParameter("pwd");
		String passwordtwo = getParameter("pwdt");
		String identifycode = getParameter("code");
//		String nickname = getParameter("nickn");
		String nickname = "";
		String invit_user = getParameter("invit");
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("code", "1");
		if (!PhoneUtil.isPhoneQualified(phone)) {
			result.put("mess", "请输入正确的手机号！");
			return result;
		}
		if (!PhoneUtil.isPasswordQualified(password)) {
			result.put("mess", "密码应该在8到18位之间！");
			return result;
		}
		if (!PhoneUtil.isPasswordQualified(passwordtwo)) {
			result.put("mess", "重复密码应该在8到18位之间！");
			return result;
		}
		if (!password.equals(passwordtwo)) {
			result.put("mess", "请保证两次输入的密码相同！");
			return result;
		}
//		if (StringUtils.isBlank(nickname) || nickname.length() < 2 || nickname.length() > 8) {
//			result.put("mess", "请设置2到8位昵称");
//			return result;
//		}
		if (StringUtils.isBlank(identifycode)) {
			result.put("mess", "请输入正确的验证码！");
			return result;
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel + "");
		params.put("telNo", phone);
		params.put("nickName", nickname);
		params.put("password", password);
		params.put("invite_user", invit_user);
		params.put("codeNo", identifycode);
		try {
			String http_result = HttpUtil.httpPost(Constants.registurl, params);
			JSONObject jo = JSONObject.fromObject(http_result);
			
			if ("100".equals(jo.get("result").toString())) {
				result.put("code", "0");
				result.put("mess", "注册成功！");
				return result;
			}else {
				result.put("code", "1");
				result.put("mess", jo.getString("resultDesc"));
				return result;
			}
			
		} catch (Exception e) {
			log.info("请求注册接口失败,error:"+e.getMessage());
			result.put("mess", "注册失败");
			return result;
		}
	}
	
	
	@RequestMapping(value = "login/page")
	public String login_page(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		if(this.servercookie==null){
			//清除本地cookie
			clearcookie();
		}else{
			String nop = this.getCookie(Constants.cookie_key);
			if (!StringUtils.isBlank(nop)) {
				nop = AESUtil.decrypt(nop);
				model.addAttribute("phone" , nop);
				response.sendRedirect(Constants.locationUrl+"homepage");
			}else{
				//清除本地cookie
				clearcookie();
			}
		}
		
		return "login";
	}
	
	@RequestMapping(value="login")
	public @ResponseBody Map<String, String> login(Model model ) {
		String nicknameorphone = this.getParameter("nop");
		String password = this.getParameter("pwd");
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("code", "1");
		if (StringUtils.isBlank(nicknameorphone)) {
			result.put("mess", "请填写用户名或手机号");
			return result;
		}
		if (!PhoneUtil.isPasswordQualified(password)) {
			result.put("mess", "请填写正确的密码");
			return result;
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel+"");
		params.put("userName", nicknameorphone);
		params.put("password", password);
		
		try {
			//首先获取一次服务器端cookie并保存
			if(this.servercookie==null||this.servercookie.getValue().length()==0)
				this.servercookie = HttpUtil.httpPost_getcookie(Constants.loginurl, params);
			super.servercookie=this.servercookie;
			String http_result = HttpUtil.httpPost(Constants.loginurl, params);
			JSONObject jo = JSONObject.fromObject(http_result);

			if ("100".equals(jo.get("result"))) {
				result.put("code", "0");
				result.put("mess", "登录成功！");
		
				this.setCookie(Constants.cookie_key, AESUtil.encrypt(nicknameorphone), Constants.EXP_HALFHOUR);
				this.setCookie(Constants.cookie_username, AESUtil.encrypt(jo.get("userName").toString()), Constants.EXP_HALFHOUR);
				this.setCookie(Constants.cookie_realstatus, AESUtil.encrypt(jo.get("real_status").toString()), Constants.EXP_HALFHOUR);
				this.setCookie(Constants.cookie_phone, AESUtil.encrypt(jo.get("phone").toString()), Constants.EXP_HALFHOUR);
				this.setCookie(Constants.cookie_img, AESUtil.encrypt(jo.get("image").toString()), Constants.EXP_HALFHOUR);
				if(jo.get("card_id")!=""&&jo.get("card_id")!=null){
					this.setCookie(Constants.cookie_cardid, AESUtil.encrypt(jo.get("card_id").toString()), Constants.EXP_HALFHOUR);
				}
				if(jo.get("realname")!=""&&jo.get("realname")!=null){
					this.setCookie(Constants.cookie_realname, AESUtil.encrypt(jo.get("realname").toString()), Constants.EXP_HALFHOUR);
				}
				String userid =jo.get("image").toString().split("&")[0].split("=")[1];
				this.setCookie(Constants.cookie_userid, AESUtil.encrypt(userid), Constants.EXP_HALFHOUR);
				return result;
			}else {
				result.put("code", "1");
				result.put("mess", "登录失败！");
				return result;
			}
		} catch (Exception e) {
			log.info("请求注册接口失败,error:"+e.getMessage());
			result.put("mess", "登录失败！");
			return result;
		}
	}
	
	
	@RequestMapping(value="logout")
	public @ResponseBody Map<String, String> loginout( Model model ) {
		
		//请求登出接口
		Map<String, String> result = new HashMap<String, String>();
		result.put("code", "1");
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel+"");
		
		try {
			
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				//清除本地cookie
				clearcookie();
			}
			String http_result = HttpUtil.httpPost_check(Constants.loginouturl, params,this.servercookie);
			JSONObject jo = JSONObject.fromObject(http_result);

			if ("100".equals(jo.get("result"))) {
				result.put("code", "0");
				result.put("mess", "登出成功！");
				//清除本地cookie
				this.setCookie(Constants.cookie_key, "", 1);
				this.setCookie(Constants.cookie_username, "", 1);
				this.setCookie(Constants.cookie_realstatus, "", 1);
				this.setCookie(Constants.cookie_phone, "", 1);
				this.setCookie(Constants.cookie_img, "", 1);
				this.setCookie(Constants.cookie_cardid, "", 1);
				this.setCookie(Constants.cookie_realname, "", 1);
				this.setCookie(Constants.cookie_userid, "", 1);
				this.servercookie=null;
				return result;
			}else {
				result.put("code", "1");
				result.put("mess", "登出失败！");
				return result;
			}
		} catch (Exception e) {
			log.info("请求登出接口失败,error:"+e.getMessage());
			result.put("mess", "登出失败！");
			return result;
		}
		
	}
	
	/*
	 * 我的账户
	 */
	@RequestMapping(value = "myaccount/page")
	public String myaccount_page(Model model) {
		Map<String, String> result = new HashMap<String, String>();

		Map<String, String> params = new HashMap<String, String>();
		String http_result ="";
		
		params.put("apiLevel", Constants.apiLevel+"");
		try {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			
			http_result = HttpUtil.httpPost_check(Constants.userinfourl, params,this.servercookie);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				result.put("code", "100");
				result.put("mess", "请求成功！");
				result.put("accountTotalAmount", jo.getString("accountTotalAmount"));
				result.put("accumulatedIncome", jo.getString("accumulatedIncome"));
				result.put("availableAmount", jo.getString("availableAmount"));
			}else {
				result.put("code", jo.get("result").toString());
				result.put("mess", jo.getString("resultDesc"));
				result.put("accountTotalAmount", "--");
				result.put("accumulatedIncome", "--");
				result.put("availableAmount", "--");
			}
		} catch (Exception e) {
			log.info("请求我的账户信息接口失败,error:"+e.getMessage());
			result.put("mess", "请求失败");
			
		}
		String userimg =this.getCookie(Constants.cookie_img).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_img));
		String username =this.getCookie(Constants.cookie_username).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_username));

		model.addAttribute("userimg", userimg);
		model.addAttribute("username", username);
		model.addAttribute("info", result);
		return "account/myAccount";
	}
	
	/*
	 * 代收详情
	 */
	@RequestMapping(value = "dsxq")
	public String moneyCollection_page(Model model) {
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String> result = new HashMap<String, String>();
		String http_result ="";
		String username =this.getCookie(Constants.cookie_key);
		params.put("apiLevel", Constants.apiLevel+"");
		try {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			
			http_result = HttpUtil.httpPost_check(Constants.getcollectdetailsurl, params,this.servercookie);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				result.put("code", "100");
				result.put("mess", "请求成功！");
				result.put("interest", jo.getString("interest"));
				result.put("recent7Amount", jo.getString("recent7Amount"));
				result.put("recent7Interest", jo.getString("recent7Interest"));
				result.put("recentDate", jo.getString("recentDate"));
				result.put("sum", jo.getString("sum"));
				log.info("code:100,message:代收详情接口请求成功");
				
			}else {
				log.info("code:"+jo.get("result").toString()+",message:代收详情接口请求失败，错误信息"+jo.getString("resultDesc"));
			
			}
		} catch (Exception e) {
			log.info("请求代收详情信息接口失败，发生异常,error:"+e.getMessage());
			
		}
		model.addAttribute("info", result);
		return "account/moneyCollectionInfo";
	}
	
	/*
	 * 更多功能
	 */
	@RequestMapping(value = "more")
	public String moreFunctions_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "other/moreFunctions";
	}
	
	/*
	 * 关于界面
	 */
	@RequestMapping(value = "about")
	public String about_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "other/about";
	}
	
	
	
	
	/*
	 * 交易记录
	 */
	@RequestMapping(value = "dealinfo")
	public String dealinfo_page(Model model) {
		Map<String, String> params = new HashMap<String, String>();
		String http_result ="";
		String username =this.getCookie(Constants.cookie_key);
		params.put("apiLevel", Constants.apiLevel+"");
		params.put("pageNo", "1");
		params.put("pageSize", "5");
		List<TradeRecord> records=new ArrayList<TradeRecord>();
		try {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			
			http_result = HttpUtil.httpPost_check(Constants.traderecordlisturl, params,this.servercookie);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				log.info("code:100,message:交易记录接口请求成功");
				
			}else {
				log.info("code:"+jo.get("result").toString()+",message:交易记录接口请求失败，错误信息"+jo.getString("resultDesc"));
			
			}
		} catch (Exception e) {
			log.info("请求交易记录信息接口失败，发生异常,error:"+e.getMessage());
			
		}
		model.addAttribute("info", http_result);
		return "account/dealInfo";
	}
	
	/*
	 * 首页
	 */
	@RequestMapping(value = "homepage")
	public String homepage_page(Model model) {
		Map<String, String> params = new HashMap<String, String>();
		String http_result ="";
		String username =this.getCookie(Constants.cookie_key);
		params.put("apiLevel", Constants.apiLevel+"");
		List<HeadImgVo> imgs=new ArrayList<HeadImgVo>();
		try {
			http_result = HttpUtil.httpPost(Constants.homepageurl, params);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				log.info("code:100,message:首页接口请求成功");
				
				imgs=jo.getJSONArray("headImgList");
			}else {
				log.info("code:"+jo.get("result").toString()+",message:首页接口请求失败，错误信息"+jo.getString("resultDesc"));
			
			}
		} catch (Exception e) {
			log.info("请求首页信息接口失败，发生异常,error:"+e.getMessage());
			
		}
		model.addAttribute("info", http_result);
		return "homePage";
	}
	
	/*
	 * 账户管理
	 */
	@RequestMapping(value = "accountmanage")
	public String accountmanage_page(Model model) {
		if(this.servercookie==null){
			//清除本地cookie
			clearcookie();
		}else{
			String nop = this.getCookie(Constants.cookie_key);
			if (!StringUtils.isBlank(nop)) {
				
			}else{
				//清除本地cookie
				clearcookie();
			}
		}
		if(this.servercookie==null){
			//本地存储的服务器相关cookie不存在，则同步清除本地cookie
			return "login";
		}
		
		String realname =this.getCookie(Constants.cookie_realname).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_realname));
		String bindemail =this.getCookie(Constants.cookie_email).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_email));
		String bindphone =this.getCookie(Constants.cookie_phone).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_phone));
	
		model.addAttribute("realname", realname);
		model.addAttribute("bindemail", bindemail);
		model.addAttribute("bindphone", bindphone);
		return "account/accountManage";
	}
	
	/*
	 * 账户信息修改
	 */
	@RequestMapping(value = "accountinfo")
	public String accountinfo_page(Model model) {
		if(this.servercookie==null){
			//清除本地cookie
			clearcookie();
		}else{
			String nop = this.getCookie(Constants.cookie_key);
			if (!StringUtils.isBlank(nop)) {
				
			}else{
				//清除本地cookie
				clearcookie();
			}
		}
		if(this.servercookie==null){
			//本地存储的服务器相关cookie不存在，则同步清除本地cookie
			return "login";
		}
		
		String username =this.getCookie(Constants.cookie_username).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_username));
		String userimg =this.getCookie(Constants.cookie_img).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_img));
		String bindphone =this.getCookie(Constants.cookie_phone).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_phone));
	
		model.addAttribute("username", username);
		model.addAttribute("userimg", userimg);
		model.addAttribute("bindphone", bindphone);
		return "account/accountInfoManage";
	}
	
	
	/*
	 * 绑定邮箱
	 */
	@RequestMapping(value = "bindemail")
	public String bindemail_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "account/bind_email";
	}
	
	/*
	 * 显示某一个标的的详情页面
	 */
		@RequestMapping(value = "bidinfo/{id}", method = RequestMethod.GET)
		public String bidinfo_page(HttpServletRequest request, Model model,
				@PathVariable("id") String id) {
			Map<String, String> result = new HashMap<String, String>();
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel + "");
			params.put("investId", id);
			String http_record_result="";
			try {
				if(this.servercookie==null){
					//清除本地cookie
					clearcookie();
				}else{
					String nop = this.getCookie(Constants.cookie_key);
					if (!StringUtils.isBlank(nop)) {
						
					}else{
						//清除本地cookie
						clearcookie();
					}
				}
				if(this.servercookie==null){
					//本地存储的服务器相关cookie不存在，则同步清除本地cookie
					return "login";
				}
				//得到投标详情信息
				String http_result = HttpUtil.httpPost(Constants.investdetailurl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "100");
					result.put("mess", "请求成功！");
					result.put("investId", jo.getString("investId"));
					result.put("status", jo.getString("status"));
					result.put("title", jo.getString("title"));
					//result.put("last_time", jo.getString("last_time"));
					//result.put("buylimit", jo.getString("buylimit"));
					result.put("repayment_time", jo.getString("repayment_time"));
					result.put("rate", jo.getString("rate"));
					result.put("termType", jo.getString("termType"));
					result.put("term", jo.getString("term"));
					result.put("totalNum", jo.getString("totalNum"));
					result.put("remainNum", jo.getString("remainNum"));
					result.put("guaranteeCompany", jo.getString("guaranteeCompany"));
					result.put("returnType", jo.getString("returnType"));
					result.put("valid_time", jo.getString("valid_time"));
					
					if(jo.get("description")!=null){
						result.put("description", jo.getString("description"));
					}else{
						result.put("description", "");
					}
					if(jo.get("pwd")!=null){
						result.put("pwd", jo.getString("pwd"));
					}
					else{
						result.put("pwd", "");
					}
					if(jo.get("buylimit")!=null){
						result.put("buylimit", jo.getString("buylimit"));
					}
					else{
						result.put("buylimit", "");
					}
					if(jo.get("last_time")!=null){
						result.put("last_time", jo.getString("last_time"));
					}
					else{
						result.put("last_time", "");
					}
					
				}else {
					result.put("code", jo.get("result").toString());
					result.put("mess", jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求标的详情信息接口失败,error:"+e.getMessage());
				result.put("mess", "请求失败");
				
			}
			
			model.addAttribute("info", result);
			return "bid/bidInfo";
		}
		
		
		/*
		 * 投标
		 */
		@RequestMapping(value="investtender")
		public @ResponseBody Map<String, String> investtender( Model model ) {
			String investId = this.getParameter("investId");
			String money = this.getParameter("money");
			String payPassword = this.getParameter("payPassword");
			String borrowPayPassword = this.getParameter("borrowPayPassword");
			
			
			Map<String, String> result = new HashMap<String, String>();
			result.put("code", "1");
			if (StringUtils.isBlank(investId)) {
				result.put("mess", "标的id为空");
				return result;
			}
			if (StringUtils.isBlank(money)) {
				result.put("mess", "请填写投标金额");
				return result;
			}
			if (StringUtils.isBlank(payPassword)) {
				result.put("mess", "请填写交易密码");
				return result;
			}
			
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("investId", investId);
			params.put("money", money);
			params.put("payPassword", payPassword);
			if(borrowPayPassword!=null&&borrowPayPassword!="")
				params.put("borrowPayPassword", borrowPayPassword);
			
		
			try {
				if(this.servercookie==null){
					//本地存储的服务器相关cookie不存在，则同步清除本地cookie
					//清除本地cookie
					this.setCookie(Constants.cookie_key, "", 1);
					this.setCookie(Constants.cookie_username, "", 1);
					this.setCookie(Constants.cookie_realstatus, "", 1);
					this.setCookie(Constants.cookie_phone, "", 1);
					this.setCookie(Constants.cookie_img, "", 1);
					this.setCookie(Constants.cookie_cardid, "", 1);
					this.setCookie(Constants.cookie_realname, "", 1);
					this.setCookie(Constants.cookie_userid, "", 1);
					result.put("mess", "账户过期、用户未登录");
					return result;
				}
				String http_result = HttpUtil.httpPost_check(Constants.tenderurl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "0");
					result.put("mess", "投资成功！");
					
					return result;
				}else {
					result.put("code", "1");
					result.put("mess", "投资失败！");
					return result;
				}
			} catch (Exception e) {
				log.info("请求投资接口失败,error:"+e.getMessage());
				result.put("mess", "投资失败！");
				return result;
			}
		}
		
		/*
		* 得到我的账户信息
		*/
		@RequestMapping(value = "getmyaccountinfo")
		public  @ResponseBody Map<String, String> getmyaccountinfo( Model model ) {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			Map<String, String> result = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel+"");
			try {
				if(this.servercookie==null){
					//本地存储的服务器相关cookie不存在，则同步清除本地cookie
					//清除本地cookie
					this.setCookie(Constants.cookie_key, "", 1);
					this.setCookie(Constants.cookie_username, "", 1);
					this.setCookie(Constants.cookie_realstatus, "", 1);
					this.setCookie(Constants.cookie_phone, "", 1);
					this.setCookie(Constants.cookie_img, "", 1);
					this.setCookie(Constants.cookie_cardid, "", 1);
					this.setCookie(Constants.cookie_realname, "", 1);
					this.setCookie(Constants.cookie_userid, "", 1);
					result.put("mess", "未检测到用户登录信息，请重新登陆！");
				}
				
				http_result = HttpUtil.httpPost_check(Constants.userinfourl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "100");
					result.put("mess", "请求成功！");
					result.put("accountTotalAmount", jo.getString("accountTotalAmount"));
					result.put("accumulatedIncome", jo.getString("accumulatedIncome"));
					result.put("availableAmount", jo.getString("availableAmount"));
				}else {
					result.put("code", jo.get("result").toString());
					result.put("mess", jo.getString("resultDesc"));
					result.put("accountTotalAmount", "--");
					result.put("accumulatedIncome", "--");
					result.put("availableAmount", "--");
				}
			} catch (Exception e) {
				log.info("请求我的账户信息接口失败,error:"+e.getMessage());
				result.put("mess", "请求失败");
				
			}
			return result;
		}
		
		/*
		* 标的投标记录查询
		*/
		@RequestMapping(value = "getinvestrecords")
		public void getinvestrecords(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			String investId = this.getParameter("investId");
			try {
				
				//得到投标记录信息
				Map<String, String> params_record = new HashMap<String, String>();
				params_record.put("apiLevel", Constants.apiLevel + "");
				params_record.put("investId", investId);
				params_record.put("pageNo", "1");
				params_record.put("pageSize", "20");
				http_result = HttpUtil.httpPost(Constants.investhistorylisturl, params_record);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:投标记录接口请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:投标记录接口请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("投标记录信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		/*
		 * 显示某一个大客户的相关信息界面
		 */
			@RequestMapping(value = "targetcustomer/{id}", method = RequestMethod.GET)
			public String targetcustomer_page(HttpServletRequest request, Model model,
					@PathVariable("id") String id) {
				model.addAttribute("rootdomain", rootdomain);
				return "customer/targetCustomer";
			}
			
		/*
		* 投资列表、转贷专区、标列表
		*/
		@RequestMapping(value = "invests", method = RequestMethod.GET)
		public String investlist_page(HttpServletRequest request, Model model) {
			model.addAttribute("rootdomain", rootdomain);
			return "bid/investList";
		}
		
		/*
		* 绝味专区
		*/
		@RequestMapping(value = "jwinvests", method = RequestMethod.GET)
		public String JWinvestlist_page(HttpServletRequest request, Model model) {
			model.addAttribute("rootdomain", rootdomain);
			return "bid/JWinvestList";
		}
		
		/*
		* 散标专区
		*/
		@RequestMapping(value = "sbinvests", method = RequestMethod.GET)
		public String SBinvestlist_page(HttpServletRequest request, Model model) {
			model.addAttribute("rootdomain", rootdomain);
			return "bid/SBinvestList";
		}
		
		/*
		* 得到标列表、转贷专区的列表、投资列表
		* http://pay.cqg365.com/p2p/app/getInvestListByArea.html?
		* areaType=3&pageNo=1&pageSize=10&status=14&borrowType=100&
		* time_limit=all&apr=all&account=all
		*/
		@RequestMapping(value = "getinvestlist")
		public void getinvestlist(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("areaType", this.getParameter("areaType"));
			params.put("pageNo", this.getParameter("pageNo"));
			params.put("pageSize", "20");
			params.put("status", this.getParameter("status"));
			params.put("borrowType", this.getParameter("borrowType"));
			params.put("time_limit", this.getParameter("time_limit"));
			params.put("apr", this.getParameter("apr"));
			params.put("account", this.getParameter("account"));
			try {
				
				
				http_result = HttpUtil.httpPost(Constants.investlisturl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:投资列表接口请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:投资列表接口请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求投资列表信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		/*
		* 得到大客户标列表
		*/
		@RequestMapping(value = "getvipborrowinfourl")
		public void getvipborrowinfourl(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			
			params.put("apiLevel", Constants.apiLevel+"");
		
			try {
				
				
				http_result = HttpUtil.httpPost(Constants.getvipborrowinfourl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:vip列表接口请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:vip列表接口请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求投资列表信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		
		/*
		 * 显示某一个vip标的的详情页面
		 */
			@RequestMapping(value = "vipbidinfo/{id}", method = RequestMethod.GET)
			public String vipbidinfo_page(HttpServletRequest request, Model model,
					@PathVariable("id") String id) {
				Map<String, String> result = new HashMap<String, String>();
				Map<String, String> params = new HashMap<String, String>();
				params.put("apiLevel", Constants.apiLevel + "");
				params.put("borrow_vip_id", id);
				String http_record_result="";
				try {
					if(this.servercookie==null){
						//清除本地cookie
						clearcookie();
					}else{
						String nop = this.getCookie(Constants.cookie_key);
						if (!StringUtils.isBlank(nop)) {
							
						}else{
							//清除本地cookie
							clearcookie();
						}
					}
					if(this.servercookie==null){
						//本地存储的服务器相关cookie不存在，则同步清除本地cookie
						return "login";
					}
					//得到投标详情信息
					String http_result = HttpUtil.httpPost(Constants.getvipborrowbyidurl, params);
					JSONObject jo = JSONObject.fromObject(http_result);
					if ("100".equals(jo.get("result"))) {
						result.put("code", "100");
						
						result.put("mess", "请求成功！");
						JSONObject borrowjo=JSONObject.fromObject(jo.getString("vipBorrow"));
						result.put("investId", borrowjo.getString("id"));
						result.put("status", borrowjo.getString("status"));
						result.put("title", borrowjo.getString("name"));
						
						result.put("rate", borrowjo.getString("apr"));
						result.put("termType", borrowjo.getString("isday"));
						result.put("term", borrowjo.getString("time_limit"));
						result.put("totalNum", borrowjo.getString("account"));
						result.put("guaranteeCompany", borrowjo.getString("org"));
						result.put("returnType", borrowjo.getString("style"));
						
						if(jo.get("description")!=null){
							result.put("description", borrowjo.getString("description"));
						}else{
							result.put("description", "");
						}
						
						
						if(jo.get("publish_time")!=null){
							result.put("last_time", borrowjo.getString("publish_time"));
						}
						else{
							result.put("last_time", "");
						}
						
					}else {
						result.put("code", jo.get("result").toString());
						result.put("mess", jo.getString("resultDesc"));
					
					}
				} catch (Exception e) {
					log.info("请求标的详情信息接口失败,error:"+e.getMessage());
					result.put("mess", "请求失败");
					
				}
				
				model.addAttribute("info", result);
				return "bid/vipbidInfo";
			}
			
			
			/*
			* vip标的投标记录查询
			*/
			@RequestMapping(value = "getvipinvestrecords")
			public void getvipinvestrecords(HttpServletResponse response, HttpServletRequest request) throws IOException {
				Map<String, String> params = new HashMap<String, String>();
				String http_result ="";
				String investId = this.getParameter("investId");
				try {
					
					//得到投标记录信息
					Map<String, String> params_record = new HashMap<String, String>();
					params_record.put("apiLevel", Constants.apiLevel + "");
					params_record.put("borrow_vip_id", investId);
					params_record.put("pageNo", "1");
					params_record.put("pageSize", "20");
					http_result = HttpUtil.httpPost(Constants.getvipborroworderinfourl, params_record);
					JSONObject jo = JSONObject.fromObject(http_result);
					if ("100".equals(jo.get("result"))) {
						log.info("code:100,message:投标记录接口请求成功");
						
					}else {
						log.info("code:"+jo.get("result").toString()+",message:投标记录接口请求失败，错误信息"+jo.getString("resultDesc"));
					
					}
				} catch (Exception e) {
					log.info("投标记录信息接口失败，发生异常,error:"+e.getMessage());
					
				}
				response.setContentType("text/html; charset=UTF-8");
		         PrintWriter out = response.getWriter();
		         out.print(http_result);
		         out.flush();
		         out.close();
			}
		/*
		* 充值页面
		*/
		@RequestMapping(value = "recharge", method = RequestMethod.GET)
		public String bindcard_page( Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			
			return "bid/recharge";
		}
		
		/*
		 * 充值
		 */
		@RequestMapping(value="mobilepay")
		public @ResponseBody Map<String, String> mobilepay( Model model ) {
			String money = this.getParameter("money");
			Map<String, String> result = new HashMap<String, String>();
			result.put("code", "1");
			if (StringUtils.isBlank(money)) {
				result.put("mess", "请填写充值金额");
				return result;
			}
			
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("money", money);
			
			try {
				
				String http_result = HttpUtil.httpPost_check(Constants.mobilebankurl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "0");
					result.put("mess", "充值成功！");
					result.put("url", jo.getString("url"));
					
					return result;
				}else {
					result.put("code", "1");
					result.put("mess", "充值失败！");
					return result;
				}
			} catch (Exception e) {
				log.info("请求充值接口失败,error:"+e.getMessage());
				result.put("mess", "充值失败！");
				return result;
			}
		}
		
		/*
		* 银行卡列表
		*/
		@RequestMapping(value = "bankcards", method = RequestMethod.GET)
		public String bankcards_page(HttpServletRequest request, Model model) {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			return "bid/bankCardList";
		}
		
		
		/*
		* 银行卡列表
		*/
		@RequestMapping(value = "getbindcards")
		public void getbankcards(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			params.put("apiLevel", Constants.apiLevel+"");
			try {
				
				
				http_result = HttpUtil.httpPost_check(Constants.getaccountbankurl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:代收详情接口请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:代收详情接口请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求代收详情信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		
		/*
		* 删除银行卡
		*/
		@RequestMapping(value = "deletebank")
		public void deletebank(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			String bankid = getParameter("bankId");
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("bankId", bankid);
			try {
				
				
				http_result = HttpUtil.httpPost_check(Constants.deletebankurl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:删除银行卡接口请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:删除银行卡接口请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求删除银行卡接口失败，发生异常,error:"+e.getMessage());
				
			}
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		
		/*
		* 添加银行卡界面
		*/
		@RequestMapping(value = "addbankcard", method = RequestMethod.GET)
		public String addbankcard_page(HttpServletRequest request, Model model) {
			if(this.servercookie==null&&super.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				//清除本地cookie
				
				this.setCookie(Constants.cookie_key, "", 1);
				this.setCookie(Constants.cookie_username, "", 1);
				this.setCookie(Constants.cookie_realstatus, "", 1);
				this.setCookie(Constants.cookie_phone, "", 1);
				this.setCookie(Constants.cookie_img, "", 1);
				this.setCookie(Constants.cookie_cardid, "", 1);
				this.setCookie(Constants.cookie_realname, "", 1);
				this.setCookie(Constants.cookie_userid, "", 1);
				return "login";
			}
			String realname =this.getCookie(Constants.cookie_realname).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_realname));
			String cardid =this.getCookie(Constants.cookie_cardid).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_cardid));
			
			model.addAttribute("realname", realname);
			model.addAttribute("cardid", cardid);
			return "bid/addbankcard";
		}
		
		/*
		 * 添加银行卡
		 */
		@RequestMapping(value="addbank")
		public @ResponseBody Map<String, String> addbank( Model model ) {
			String cardNumber = this.getParameter("cardNumber");
			String openBank = this.getParameter("openBank");
			String province = this.getParameter("province");
			String city = this.getParameter("city");
			String area = this.getParameter("area");
			String branchName = this.getParameter("branchName");
			String codeNo = this.getParameter("codeNo");
			
			Map<String, String> result = new HashMap<String, String>();
			result.put("code", "1");
			if (StringUtils.isBlank(cardNumber)) {
				result.put("mess", "请填写银行卡号");
				return result;
			}
			if (StringUtils.isBlank(openBank)) {
				result.put("mess", "请填写开户行");
				return result;
			}
			if (StringUtils.isBlank(province)) {
				result.put("mess", "请填写开户省");
				return result;
			}
			if (StringUtils.isBlank(city)) {
				result.put("mess", "请填写开户市");
				return result;
			}
			if (StringUtils.isBlank(area)) {
				result.put("mess", "请填写开户区");
				return result;
			}
			if (StringUtils.isBlank(branchName)) {
				result.put("mess", "请填写开户支行");
				return result;
			}
			if (StringUtils.isBlank(codeNo)) {
				result.put("mess", "请填写验证码");
				return result;
			}
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("cardNumber", cardNumber);
			params.put("openBank", openBank);
			params.put("province", province);
			params.put("city", city);
			params.put("area", area);
			params.put("branchName", branchName);
			params.put("codeNo", codeNo);
			try {
				
				String http_result = HttpUtil.httpPost_check(Constants.addbankurl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "0");
					result.put("mess", "新增成功！");
					
					return result;
				}else {
					result.put("code", "1");
					result.put("mess", "新增失败！");
					return result;
				}
			} catch (Exception e) {
				log.info("请求新增银行卡接口失败,error:"+e.getMessage());
				result.put("mess", "认证失败！");
				return result;
			}
		}
		
		/*
		* 临时测试所有功能接口测试页面
		*/
		@RequestMapping(value = "test", method = RequestMethod.GET)
		public String test_page(HttpServletRequest request, Model model) {
			
			return "bid/test";
		}
		
		
		/*
		 * 得到添加银行卡验证码
		 */
		@RequestMapping(value="getbindcardcode")
		public @ResponseBody Map<String, String> getbindcardcode( Model model ) {
			String phone = getParameter("phone");
			Map<String, String> result = new HashMap<String, String>();
			result.put("code", "1");
			if (!PhoneUtil.isPhoneQualified(phone)) {
				result.put("mess", "请输入正确的手机号！");
				return result;
			}
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel + "");
			params.put("phoneNo", phone);
			try {
				String http_result = HttpUtil.httpPost_check(Constants.sendphonecodeaddbankurl, params,this.servercookie);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "0");
					result.put("mess", "注册成功！");
					return result;
				}else {
					result.put("code", "1");
					result.put("mess", jo.getString("resultDesc"));
					return result;
				}
			} catch (Exception e) {
				log.info("请求发送验证码接口失败,error:"+e.getMessage());
				result.put("mess", "注册失败");
				return result;
			}
		}
			
		
		/*
		 * 获得一级银行信息
		 */
		@RequestMapping(value = "getbanks")
		public void getbanks_page(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String http_result ="";
			params.put("apiLevel", Constants.apiLevel+"");
			
			try {
				http_result = HttpUtil.httpPost(Constants.getbankdataurl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:银行请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:银行请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求银行信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			 response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		
		/*
		 * 获得地区信息-省
		 */
		@RequestMapping(value = "getareas")
		public void getareas_page(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String areaid = getParameter("areaid");
			String http_result ="";
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("pid", areaid);
			try {
				http_result = HttpUtil.httpPost(Constants.showareaurl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:地区请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:地区请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求地区信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			 response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		
		/*
		 * 获得支行信息
		 */
		@RequestMapping(value = "getbankbranchs")
		public void getbankbranchs_page(HttpServletResponse response, HttpServletRequest request) throws IOException {
			Map<String, String> params = new HashMap<String, String>();
			String bank = getParameter("bank");
			String province = getParameter("province");
			String city = getParameter("city");
			String area = getParameter("area");
			
			String http_result ="";
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("bank", bank);
			params.put("province", province);
			params.put("city", city);
			params.put("area", area);
			
			try {
				http_result = HttpUtil.httpPost(Constants.getbranchsurl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					log.info("code:100,message:支行请求成功");
					
				}else {
					log.info("code:"+jo.get("result").toString()+",message:支行请求失败，错误信息"+jo.getString("resultDesc"));
				
				}
			} catch (Exception e) {
				log.info("请求支行信息接口失败，发生异常,error:"+e.getMessage());
				
			}
			 response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.print(http_result);
	         out.flush();
	         out.close();
		}
		
		/*
		 * 找回密码
		 */
		@RequestMapping(value = "getback_pwd")
		public String getback_pwd_page(HttpServletRequest request,Model model) {
			String phone = getParameter("phone");
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel + "");
			params.put("phoneNo", phone);
			String http_result = HttpUtil.httpPost(Constants.codeurl, params);
			//JSONObject jo = JSONObject.fromObject(http_result);	
			model.addAttribute("rootdomain", http_result);
			return "account/getback_pwd";
		}
		
		
		/*
		 * 意见反馈  (未提供接口)
		 */
		@RequestMapping(value = "feedback")
		public String feedback_page(Model model) {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			return "account/feedback";
		}
		
		/*
		 * 重置密码
		 */
		@RequestMapping(value = "pwd_reset")
		public String pwd_reset_page(Model model) {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			return "account/pwd_reset";
		}
		
		/*
		 * 实名认证
		 */
		@RequestMapping(value = "rn_confirm/page")
		public String realnameConfirm_page(Model model) {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			return "account/rn_confirm";
		}
		
		@RequestMapping(value="rn_confirm")
		public @ResponseBody Map<String, String> rnconfirm( Model model ) {
			String realname = this.getParameter("realname");
			String cardid = this.getParameter("id");
			
			Map<String, String> result = new HashMap<String, String>();
			result.put("code", "1");
			if (StringUtils.isBlank(realname)) {
				result.put("mess", "请填写姓名");
				return result;
			}
			if (StringUtils.isBlank(cardid)) {
				result.put("mess", "请填写身份证号");
				return result;
			}
			String userid =this.getCookie(Constants.cookie_userid).toString()==""?"":AESUtil.decrypt(this.getCookie(Constants.cookie_userid));
			Map<String, String> params = new HashMap<String, String>();
			params.put("apiLevel", Constants.apiLevel+"");
			params.put("user_id", userid);
			params.put("realName", realname);
			params.put("idNumber", cardid);
			try {
				String http_result = HttpUtil.httpPost(Constants.authenticationurl, params);
				JSONObject jo = JSONObject.fromObject(http_result);
				if ("100".equals(jo.get("result"))) {
					result.put("code", "0");
					result.put("mess", "认证成功！");
					this.setCookie(Constants.cookie_realname, AESUtil.encrypt(realname), Constants.EXP_ONEDAY);
					
					return result;
				}else {
					result.put("code", "1");
					result.put("mess", "认证失败！");
					return result;
				}
			} catch (Exception e) {
				log.info("请求认证接口失败,error:"+e.getMessage());
				result.put("mess", "认证失败！");
				return result;
			}
		}
		
		/*
		 * 验证账户信息
		 */
		@RequestMapping(value = "indetify_account")
		public String idetify_page(Model model) {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			return "account/indetify_account";
		}
		
		/*
		 * 修改交易密码
		 */
		@RequestMapping(value = "update_pwd")
		public String update_pwd_page(Model model) {
			if(this.servercookie==null){
				//清除本地cookie
				clearcookie();
			}else{
				String nop = this.getCookie(Constants.cookie_key);
				if (!StringUtils.isBlank(nop)) {
					
				}else{
					//清除本地cookie
					clearcookie();
				}
			}
			if(this.servercookie==null){
				//本地存储的服务器相关cookie不存在，则同步清除本地cookie
				return "login";
			}
			return "account/update_pwd";
		}
		
		public void clearcookie(){
			this.servercookie=null;
			//清除本地cookie
			this.setCookie(Constants.cookie_key, "", 1);
			this.setCookie(Constants.cookie_username, "", 1);
			this.setCookie(Constants.cookie_realstatus, "", 1);
			this.setCookie(Constants.cookie_phone, "", 1);
			this.setCookie(Constants.cookie_img, "", 1);
			this.setCookie(Constants.cookie_cardid, "", 1);
			this.setCookie(Constants.cookie_realname, "", 1);
			this.setCookie(Constants.cookie_userid, "", 1);
			
		}

}
