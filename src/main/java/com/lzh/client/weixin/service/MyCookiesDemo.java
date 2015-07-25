package com.lzh.client.weixin.service;

import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.CookieStore;
import java.net.HttpCookie;
import java.net.URI;
import java.util.List;

public class MyCookiesDemo {
	private static CookieManager manager = new CookieManager();
	
	public static void storecoo(URI uri,String strcoo) {
	
		// ����һ��Ĭ�ϵ� CookieManager
		

		// ������ĵ����������е� Cookie
		manager.setCookiePolicy(CookiePolicy.ACCEPT_ALL);

		// ����������Ƶ� CookieManager
		CookieHandler.setDefault(manager);

		// ���� HTTP �����ʱ�򣬵õ��ͱ����µ� Cookie
		HttpCookie cookie = new HttpCookie("Cookie: ", strcoo);
		cookie.setMaxAge(6000);
		manager.getCookieStore().add(uri, cookie);
	}
	
	public static HttpCookie getcookies(){
		
		HttpCookie res = null;
		// ʹ�� Cookie ��ʱ��
		// ȡ�� CookieStore
		CookieStore store = manager.getCookieStore();

		// �õ����е� URI
		List<URI> uris = store.getURIs();
		for (URI ur : uris) {
			// ɸѡ��Ҫ�� URI
			// �õ�������� URI ������ Cookie
			List<HttpCookie> cookies = store.get(ur);
			for (HttpCookie coo : cookies) {
				res = coo;
			}
		}
		return res;
	}
}
