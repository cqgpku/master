package com.lzh.client.controller;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzh.client.util.AESUtil;
import com.lzh.client.util.Constants;
import com.lzh.client.util.HttpUtil;
import com.lzh.client.util.PhoneUtil;
import com.lzh.client.util.StringUtils;

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
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				result.put("code", "0");
				return result;
			}else {
				result.put("code", "1");
				return result;
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
			log.info("请求注册接口失败,error:"+e.getMessage());
			result.put("mess", "注册失败");
			return result;
		}
	}
	
	
	@RequestMapping(value = "login/page")
	public String login_page(Model model) {
		String nop = this.getCookie(Constants.cookie_key);
		if (!StringUtils.isBlank(nop)) {
			nop = AESUtil.decrypt(nop);
			if (!StringUtils.isBlank(nop)) {
				model.addAttribute("phone" , nop);
				model.addAttribute("rootdomain", rootdomain);
				return "logined";
			}
		}
		
		model.addAttribute("rootdomain", rootdomain);
		return "login";
	}
	
	@RequestMapping(value="login")
	public @ResponseBody Map<String, String> login( Model model ) {
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
			String http_result = HttpUtil.httpPost(Constants.loginurl, params);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				result.put("code", "0");
				result.put("mess", "登录成功！");
				this.setCookie(Constants.cookie_key, AESUtil.encrypt(nicknameorphone), Constants.EXP_ONEDAY);
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
		this.setCookie(Constants.cookie_key, "", 1);
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", "0");
		return map;
	}
	
	/*
	 * 我的账户
	 */
	@RequestMapping(value = "myaccount/page")
	public String myaccount_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "account/myAccount";
	}
	
	/*
	 * 代收详情
	 */
	@RequestMapping(value = "dsxq")
	public String moneyCollection_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
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
		model.addAttribute("rootdomain", rootdomain);
		return "account/dealInfo";
	}
	
	/*
	 * 首页
	 */
	@RequestMapping(value = "homepage")
	public String homepage_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "homePage";
	}
	
	/*
	 * 账户管理
	 */
	@RequestMapping(value = "accountmanage")
	public String accountmanage_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "account/accountManage";
	}
	
	/*
	 * 账户信息修改
	 */
	@RequestMapping(value = "accountinfo")
	public String accountinfo_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
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
	
}
