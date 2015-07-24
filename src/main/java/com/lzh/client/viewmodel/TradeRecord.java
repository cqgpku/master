package com.lzh.client.viewmodel;

import java.util.ArrayList;
import java.util.List;

public class TradeRecord {
	private String Time;
	private List<TradeRecordItem> Records=new ArrayList<TradeRecordItem>();
	
	public String getTime() {
		return Time;
	}

	public void setTime(String time) {
		this.Time = time;
	}
	
	public List<TradeRecordItem> getRecords() {
		return Records;
	}

	public void setRecords(List<TradeRecordItem> records) {
		this.Records = records;
	}
}
