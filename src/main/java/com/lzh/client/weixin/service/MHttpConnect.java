package com.lzh.client.weixin.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class MHttpConnect {

	/**
	 * String Base url
	 * */
	private static final String baseurl = "http://rexian.beijing.gov.cn/frantPageFor8.pr.prNewLetterViewList.do";

	private static final String Dataencoding = "UTF-8";
	/**
	 * int timeout ��ʱʱ�� Ĭ�� 6000ms
	 * */
	public int timeout = 6000;
	/**
	 * boolean doinput �Ƿ���������˷������ Ĭ��Ϊ true
	 * */
	public boolean doinput = true;
	/**
	 * boolean dooutput �Ƿ���շ������˷��͵���� Ĭ��Ϊ true
	 * */
	public boolean dooutput = true;

	/**
	 * The HttpURLConnection to connect the website.
	 * */
	public HttpURLConnection hc = null;

	/**
	 * sendCoding String ��������ı��뷽ʽ��
	 * */
	public String sendCoding = "UTF-8";

	/**
	 * Parsecode String ���ؽ���ʱ�ı��뷽ʽ��
	 * */
	public static final String Parsecode = "GBK";

	/**
	 * 
	 * */
	public static String cookie = null;

	public MHttpConnect(String ec) {
		this.sendCoding = ec;
	}

	public MHttpConnect() {

	}

	/**
	 * @throws Exception
	 * 
	 * */
	public void initCon(String str) throws Exception {
		URL url = null;
		if (str != null && !str.equals("")) {
			url = new URL(str);
		} else
			url = new URL(MHttpConnect.baseurl);
		hc = (HttpURLConnection) url.openConnection();
		hc.setConnectTimeout(timeout);
		hc.setDoInput(doinput);
		hc.setDoOutput(dooutput);
		hc.setUseCaches(false);
		hc.setRequestProperty("Content-Type",
				"application/x-www-form-urlencoded");
		HttpURLConnection.setFollowRedirects(false);
		hc.setRequestProperty("Cookie","Cookie: "+MHttpConnect.cookie); // ע��cookie ��String
														// cookie��
	}

	/**
	 * @param postdata
	 *            String Ҫ���͵���ݡ�
	 * @throws Exception
	 * */
	public void sendPost(String postdata) throws Exception {
		// String send = URLEncoder.encode(postdata, MHttpConnect.Dataencoding);
		OutputStream os = hc.getOutputStream();
		OutputStreamWriter osw = new OutputStreamWriter(os, this.sendCoding);
		osw.write(postdata);
		osw.flush();
		osw.close();
		os.close();
	}

	/**
	 * ��ȡ���
	 * 
	 * @return String ��ȡ�����ݡ�
	 * */
	public String readData() throws IOException {
		int code = hc.getResponseCode();
		StringBuffer sb = null;
		if (code == HttpURLConnection.HTTP_OK) {
			sb = new StringBuffer();
			InputStream is = hc.getInputStream();// ��ȡ������
			InputStreamReader isr = new InputStreamReader(is,
					MHttpConnect.Parsecode);// ��װ������ָ�����뷽ʽ��
			BufferedReader br = new BufferedReader(isr);

			String line = null;
			do {
				line = br.readLine();// ��ȡ����
				
				if (line != null && !line.equals("")) {
					line = line.trim();
					line = line.replaceAll("&nbsp;", "");
					sb.append(line);
				}
			} while (line != null);
			// �ر���
			br.close();
			isr.close();
			is.close();
			return sb.toString();
		} else
			return null;
	}

	/**
	 * �ر�����
	 * */
	public void killconnet() {
		hc.disconnect();

	}
}
