package com.lzh.client.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lzh.client.util.Setting;
import com.lzh.client.util.StringUtils;

@Controller
public abstract class BaseController {
	private static final Log log = LogFactory.getLog(BaseController.class);
	//protected static String rootdomain = Setting.getSetting("rootdomain")+":8080";
	protected static String rootdomain ="http://test.cqg365.com:81/weixin";
	private HttpServletRequest request;
	private HttpServletResponse response;

	public HttpServletRequest getRequest() {
		return request;
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	
//	@Resource
	@ModelAttribute
	public void setRequestandResponse(HttpServletRequest request , HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}
	
	protected String getParameter(String key) {
		return this.request.getParameter(key);
	}
	
	protected String getCookie(String key) {
		if (StringUtils.isBlank(key)) {
			return "";
		}
		Cookie[] cookies = getRequest().getCookies();
		String value = "";
		if (cookies != null) {
			for (Cookie thisCookie : cookies) {
				if (key.equals(thisCookie.getName())) {
					value = thisCookie.getValue();
					break;
				}
			}
		}
		return value;
	}
	
	protected String setCookie(String key,String value,int exp) {
		if (StringUtils.isBlank(key)) {
			return null;
		}
		Cookie  userCookie = new Cookie(key, value);
		userCookie.setMaxAge(exp); 
	      //设置Cookie路径和域名
		userCookie.setPath("/") ;
//		if(){
//			userCookie.setDomain(".58.com") ;
//		}else {
			//userCookie.setDomain(Setting.getSetting("cookiedomain")) ;
			userCookie.setDomain(".58v5.cn") ;
//		}
		this.getResponse().addCookie(userCookie); 
		return value;
	}
	
	
}
