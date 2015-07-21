package com.lzh.client.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TextController extends BaseController {
private static final Log log = LogFactory.getLog(AccountController.class);
	

	@RequestMapping(value = "yhxy")
	public String register_page(Model model) {
		model.addAttribute("rootdomain", rootdomain);
		return "yhxy";
	}
}
