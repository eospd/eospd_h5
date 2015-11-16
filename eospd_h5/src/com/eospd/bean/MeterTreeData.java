package com.eospd.bean;

public class MeterTreeData{
	private String title;
	private String addr;
	private String dc;
	private String dc_sn;
	private int status;
	public MeterTreeData(String s_title, String s_addr, String s_dc, String s_dc_sn, int s_stats) {
		this.title = s_title;
		this.addr = s_addr;
		this.dc = s_dc;
		this.dc_sn = s_dc_sn;
		this.status = s_stats;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc;
	}
	public String getDc_sn() {
		return dc_sn;
	}
	public void setDc_sn(String dc_sn) {
		this.dc_sn = dc_sn;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}