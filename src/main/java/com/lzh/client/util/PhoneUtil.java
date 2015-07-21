package com.lzh.client.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author lizhuohang
 *
 * 2014年7月16日
 */
public class PhoneUtil {
	
	public static boolean isPhoneQualified(String phone) {
		if (phone.length() != 11) {
			return false;
		}
		Pattern pattern = Pattern.compile("^1[3|4|5|7|8][0-9]\\d{4,8}");
		Matcher matcher = pattern.matcher(phone);
		if (!matcher.find()) {
			return false;
		}
		return true;
	}
	
	public static String transferPhone(String phone) {
		if (!isPhoneQualified(phone)) {
			return "";
		}
		String firString = phone.substring(0, 3);
		firString += "****";
		firString += phone.substring(7);
		return firString;
	}
	
	public static boolean isPasswordQualified(String password) {
		if (StringUtils.isBlank(password)) {
			return false;
		}
		if (password.length() > 18 || password.length() < 8) {
			return false;
		}
		return true;
	}
}
