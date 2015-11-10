package com.eospd.bean;

import java.sql.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/*
 * 
CREATE TABLE `collectindexday` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `indexTime` datetime DEFAULT NULL COMMENT '采集指标时间，年月日有效',
  `deviceId` int(11) DEFAULT NULL COMMENT '仪表ID，=0指系统采集指标；>0指某仪表采集指标 meter表的deviceId列',
  `dataEffRate` decimal(5,2) DEFAULT NULL COMMENT '数据有效率',
  `meterOnlineRate` decimal(5,2) DEFAULT NULL COMMENT '仪表在线率',
  `realCollectRate` decimal(5,2) DEFAULT NULL COMMENT '实时采集率',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='1 数据采集指标日表';
 */


@Table("collectindexday")
public class CollectIndexDay {
	@Id
	private int indexId;
	@Column
	private Date indexTime;
	@Column
	private int deviceId;
	@Column
	private double dataEffRate;
	@Column
	private double meterOnlineRate;
	@Column
	private double realCollectRate;
	
	public int getIndexId() {
		return indexId;
	}
	public void setIndexId(int indexId) {
		this.indexId = indexId;
	}
	public Date getIndexTime() {
		return indexTime;
	}
	public void setIndexTime(Date indexTime) {
		this.indexTime = indexTime;
	}
	public int getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}
	public double getDataEffRate() {
		return dataEffRate;
	}
	public void setDataEffRate(double dataEffRate) {
		this.dataEffRate = dataEffRate;
	}
	public double getMeterOnlineRate() {
		return meterOnlineRate;
	}
	public void setMeterOnlineRate(double meterOnlineRate) {
		this.meterOnlineRate = meterOnlineRate;
	}
	public double getRealCollectRate() {
		return realCollectRate;
	}
	public void setRealCollectRate(double realCollectRate) {
		this.realCollectRate = realCollectRate;
	}
}
