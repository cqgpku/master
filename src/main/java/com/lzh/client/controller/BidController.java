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

import com.lzh.client.util.Constants;
import com.lzh.client.util.HttpUtil;
import com.lzh.client.util.PhoneUtil;

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
		String http_record_result="";
		try {
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
				
				//得到投标记录信息
				Map<String, String> params_record = new HashMap<String, String>();
				params_record.put("apiLevel", Constants.apiLevel + "");
				params_record.put("investId", id);
				params_record.put("pageNo", "1");
				http_record_result = HttpUtil.httpPost(Constants.investhistorylisturl, params_record);
				
			}else {
				result.put("code", jo.get("result").toString());
				result.put("mess", jo.getString("resultDesc"));
			
			}
		} catch (Exception e) {
			log.info("请求标的详情信息接口失败,error:"+e.getMessage());
			result.put("mess", "请求失败");
			
		}
		
		model.addAttribute("info", result);
		model.addAttribute("inforecord", http_record_result);
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
		
	/*
	* 投资列表
	*/
	@RequestMapping(value = "invests", method = RequestMethod.GET)
	public String investlist_page(HttpServletRequest request, Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "bid/investList";
	}
	
	/*
	* 充值页面
	*/
	@RequestMapping(value = "recharge", method = RequestMethod.GET)
	public String bindcard_page(HttpServletRequest request, Model model) {
		
		return "bid/recharge";
	}
	
	/*
	* 银行卡列表
	*/
	@RequestMapping(value = "bankcards", method = RequestMethod.GET)
	public String bankcards_page(HttpServletRequest request, Model model) {
		
		return "bid/bankCardList";
	}
	
	/*
	* 添加银行卡界面
	*/
	@RequestMapping(value = "addbankcard", method = RequestMethod.GET)
	public String addbankcard_page(HttpServletRequest request, Model model) {
		
		return "bid/addbankcard";
	}
	
	/*
	* 临时测试所有功能接口测试页面
	*/
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test_page(HttpServletRequest request, Model model) {
		
		return "bid/test";
	}
	
	
	/*
	 * 得到绑定银行卡验证码
	 */
	@RequestMapping(value="getbindcardcode")
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
			String http_result = HttpUtil.httpPost(Constants.sendphonecodeaddbankurl, params);
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
		
}
