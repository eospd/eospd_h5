package com.eospd.bean;

import java.util.ArrayList;
import java.util.List;

public class DcTreeData{
	private String title;
	private String ip;
	private int status;
	private List<Integer> sns;
	
	public DcTreeData(String s_title, String s_ip, int s_status, int s_sns) {
		this.title = s_title;
		this.ip = s_ip;
		this.status = s_status;
		this.sns = new ArrayList<Integer>();
		
		for (int i = 1; i <= s_sns; ++i) {
			this.sns.add(i);
		}
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<Integer> getSns() {
		return sns;
	}
	public void setSns(List<Integer> sns) {
		this.sns = sns;
	}
}
