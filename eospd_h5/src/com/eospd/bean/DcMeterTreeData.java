package com.eospd.bean;

import java.util.List;

public class DcMeterTreeData {
	private List<DcTreeData> dcs;
	
	private List<MeterTreeData> meters;
	
	public List<DcTreeData> getDcs() {
		return dcs;
	}
	public void setDcs(List<DcTreeData> dcs) {
		this.dcs = dcs;
	}
	public List<MeterTreeData> getMeters() {
		return meters;
	}
	public void setMeters(List<MeterTreeData> meters) {
		this.meters = meters;
	}
}
