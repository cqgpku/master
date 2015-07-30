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
	
	
	
	
}
