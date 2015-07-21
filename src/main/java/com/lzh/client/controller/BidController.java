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

import com.lzh.client.util.Constants;
import com.lzh.client.util.HttpUtil;

/*
 * 标的相关controller
 */
@Controller
public class BidController extends BaseController {
private static final Log log = LogFactory.getLog(AccountController.class);
	
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
		try {
			String http_result = HttpUtil.httpPost(Constants.investdetailurl, params);
			JSONObject jo = JSONObject.fromObject(http_result);
			if ("100".equals(jo.get("result"))) {
				result.put("code", "100");
				result.put("mess", "请求成功！");
				result.put("investId", jo.getString("investId"));
				result.put("status", jo.getString("status"));
				result.put("title", jo.getString("title"));
				result.put("last_time", jo.getString("last_time"));
				result.put("buylimit", jo.getString("buylimit"));
				result.put("repayment_time", jo.getString("repayment_time"));
				result.put("rate", jo.getString("rate"));
				result.put("termType", jo.getString("termType"));
				result.put("term", jo.getString("term"));
				result.put("totalNum", jo.getString("totalNum"));
				result.put("remainNum", jo.getString("remainNum"));
				result.put("guaranteeCompany", jo.getString("guaranteeCompany"));
				result.put("returnType", jo.getString("returnType"));
				result.put("description", jo.getString("description"));
			}else {
				result.put("code", jo.get("result").toString());
				result.put("mess", jo.getString("resultDesc"));
			
			}
		} catch (Exception e) {
			log.info("请求标的详情信息接口失败,error:"+e.getMessage());
			result.put("mess", "请求失败");
			
		}
		
		model.addAttribute("rootdomain", rootdomain);
		return "bid/bidInfo";
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
}
