package com.eospd.bean;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Index;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.TableIndexes;

/*
 * 
 CREATE TABLE `dc` (
  `dcId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长',
  `dcUrl` varchar(200) NOT NULL COMMENT '数据采集器Url',
  `location` varchar(200) DEFAULT NULL COMMENT '位置',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `channelCount` int(11) DEFAULT NULL COMMENT '通道数量',
  `dcIP` varchar(20) DEFAULT NULL COMMENT '数据采集器IP地址',
  `autoSign` int(11) NOT NULL COMMENT '自动添加标志，1-自动添加，0-手工添加',
  `installTime` datetime DEFAULT NULL COMMENT '安装时间',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`dcId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='4 数据采集器信息表';
 */
@Table("dc")
public class Dc {
	@Id
	private int dcId;
	@Column
	private String dcUrl;
	
	@Column
	private String dcName;
	@Column
	private String location;
	@Column("`desc`")
	private String desc;
	@Column
	private int channelCount;
	@Column
	private String dcIP;
	@Column
	private int autoSign;
	@Column
	private Date installTime;
	@Column
	private Date insertTime;
	public int getDcId() {
		return dcId;
	}
	public void setDcId(int dcId) {
		this.dcId = dcId;
	}
	public String getDcUrl() {
		return dcUrl;
	}
	public void setDcUrl(String dcUrl) {
		this.dcUrl = dcUrl;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getChannelCount() {
		return channelCount;
	}
	public void setChannelCount(int channelCount) {
		this.channelCount = channelCount;
	}
	public String getDcIP() {
		return dcIP;
	}
	public void setDcIP(String dcIP) {
		this.dcIP = dcIP;
	}
	public int getAutoSign() {
		return autoSign;
	}
	public String getDcName() {
		return dcName;
	}
	public void setDcName(String dcName) {
		this.dcName = dcName;
	}
	public void setAutoSign(int autoSign) {
		this.autoSign = autoSign;
	}
	public Date getInstallTime() {
		return installTime;
	}
	public void setInstallTime(Date installTime) {
		this.installTime = installTime;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
}
