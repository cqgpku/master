package com.lzh.client.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

@Controller
public class InfoController extends BaseController {
private static final Log log = LogFactory.getLog(InfoController.class);
//	/*
//	 * 绑定邮箱
//	 */
//	@RequestMapping(value = "bindemail")
//	public String bindemail_page(Model model) {
//		model.addAttribute("rootdomain", "hello world");
//		return "account/bind_email";
//	}
	
	/*
	 * 绑定邮箱
	 */
	@RequestMapping(value = "bind_email", method = RequestMethod.GET)
	public String bindemail_page(HttpServletRequest request, Model model) {		
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel + "");
		String http_result = HttpUtil.httpPost(Constants.userinfourl, params);
		//JSONObject jo = JSONObject.fromObject(http_result);	
		model.addAttribute("rootdomain", http_result);
//		System.out.print(rootdomain);
		return "account/bind_email";
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
		model.addAttribute("rootdomain", "hello world");
		return "account/feedback";
	}
	
	/*
	 * 重置密码
	 */
	@RequestMapping(value = "pwd_reset")
	public String pwd_reset_page(Model model) {
		model.addAttribute("rootdomain", "hello world");
		return "account/pwd_reset";
	}
	
	/*
	 * 实名认证
	 */
	@RequestMapping(value = "rn_confirm/page")
	public String realnameConfirm_page(Model model) {
		model.addAttribute("rootdomain", "hello world");
		return "account/rn_confirm";
	}
	
	@RequestMapping(value="rn_confirm")
	public @ResponseBody Map<String, String> login( Model model ) {
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
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("apiLevel", Constants.apiLevel+"");
		params.put("user_id", "20102");
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
		model.addAttribute("rootdomain", "hello world");
		return "account/indetify_account";
	}
	
	/*
	 * 修改交易密码
	 */
	@RequestMapping(value = "update_pwd")
	public String update_pwd_page(Model model) {
		model.addAttribute("rootdomain", "hello world");
		return "account/update_pwd";
	}
	
	
}
