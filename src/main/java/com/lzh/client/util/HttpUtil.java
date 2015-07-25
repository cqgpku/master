package com.lzh.client.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import com.lzh.client.weixin.service.MyCookiesDemo;
import com.lzh.client.weixin.service.TestConnect;

public class HttpUtil {
	
	public static String httpPost(String url, Map<String, String> params) {
	
		URL u = null;
		HttpURLConnection con = null;
		StringBuffer sb = new StringBuffer();// 构建请求参数
		if (params != null) {
			for (Entry<String, String> e : params.entrySet()) {
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
			}
			sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:" + url);
		System.out.println("send_data:" + sb.toString());
		// 尝试发送请求
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		
		//读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return buffer.toString();
	}
	
	public static HttpCookie httpPost_getcookie(String url, Map<String, String> params) {
		HttpCookie hcoo =null;
		URI uri = null;
		StringBuffer sb = new StringBuffer();// 构建请求参数
		if (params != null) {
			for (Entry<String, String> e : params.entrySet()) {
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
			}
			sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:" + url);
		System.out.println("send_data:" + sb.toString());
		String urlstr=url+"?"+sb.toString();
		
		try {
			
			TestConnect tc = new TestConnect();
			
			try {
				uri = new URI("http://pay.cqg365.com/p2p/app/");
			} catch (URISyntaxException e) {
				
				e.printStackTrace();
			}
			MyCookiesDemo.storecoo(uri, tc.test1(urlstr));
			hcoo = MyCookiesDemo.getcookies();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return hcoo;
	}
	
	public static String httpPost_check(String url, Map<String, String> params,HttpCookie servercookie) {
		String sessionid="";
		URL u = null;
		URI uri = null;
		HttpURLConnection con = null;
		StringBuffer sb = new StringBuffer();// 构建请求参数
		if (params != null) {
			for (Entry<String, String> e : params.entrySet()) {
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
			}
			sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:" + url);
		System.out.println("send_data:" + sb.toString());
		// 尝试发送请求
		try {
			
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			if(servercookie!=null&&!servercookie.hasExpired()){
				con.setRequestProperty("Cookie","Cookie: "+servercookie.getValue());
			}
			con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		
		//读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
	
	public String getcookie(HttpURLConnection hc) {
		String cookieskey = "Set-Cookie";
		Map<String, List<String>> maps = hc.getHeaderFields();
		List<String> coolist = maps.get(cookieskey);
		Iterator<String> it = coolist.iterator();
		StringBuffer sbu = new StringBuffer();
		sbu.append("eos_style_cookie=default; ");
		while(it.hasNext()){
			sbu.append(it.next()+" ");
		}
		System.out.println(sbu.toString());
		return sbu.toString();
	}
	
}
