package com.lzh.client.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

/*
 * 标的相关controller
 */
@Controller
public class BidController extends BaseController {
private static final Log log = LogFactory.getLog(AccountController.class);
	
	
}
