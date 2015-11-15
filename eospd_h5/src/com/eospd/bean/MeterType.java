package com.eospd.bean;

import java.sql.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/*
 *
 CREATE TABLE `metertype` (
  `dataTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeUrl` varchar(200) NOT NULL COMMENT '类型Url',
  `typeName` varchar(50) NOT NULL COMMENT '类型名称',
  `desc` varchar(400) DEFAULT NULL,
  `venderId` int(11) DEFAULT '0' COMMENT '厂家ID',
  `autoSign` int(11) NOT NULL COMMENT '自动添加标志，1-自动添加，0-手工添加',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`dataTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='8 仪表型号信息表';
 */
@Table("metertype")
public class MeterType {

	@Id
	private int dataTypeId;
	@Column
	private String typeUrl;
	@Column
	private String typeName;
	@Column
	private String desc;
	@Column
	private int venderId;
	@Column
	private int autoSign;
	@Column
	private Date insertTime;
	@Column
	private Date updateTime;
	public int getDataTypeId() {
		return dataTypeId;
	}
	public void setDataTypeId(int dataTypeId) {
		this.dataTypeId = dataTypeId;
	}
	public String getTypeUrl() {
		return typeUrl;
	}
	public void setTypeUrl(String typeUrl) {
		this.typeUrl = typeUrl;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getVenderId() {
		return venderId;
	}
	public void setVenderId(int venderId) {
		this.venderId = venderId;
	}
	public int getAutoSign() {
		return autoSign;
	}
	public void setAutoSign(int autoSign) {
		this.autoSign = autoSign;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}
