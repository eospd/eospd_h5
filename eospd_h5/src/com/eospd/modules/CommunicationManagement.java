package com.eospd.modules;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

public class CommunicationManagement {

	@At("/cm")
	@Ok("jsp:jsp.communication_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String index() {
		return "";
	}

	@At("/cm_chart")
	@Ok("jsp:jsp.cm_chart")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String chart() {
		return "";
	}

	@At("/cm_his")
	@Ok("jsp:jsp.cm_his")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String his() {
		return "";
	}

	@SuppressWarnings({ "rawtypes"})
	@At("/cm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch,
			@Param("columns[1][search][value]") int deviceType, @Param("columns[0][search][value]") String sValue) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "";
		String sqlString1 = "";
		String[] sArray = new String[]{"2015-11-15", "2015-11-15"};

		if (deviceType == 1) {
			sqlString = "SELECT a.currentTime, a.deviceType, b.dcUrl as deviceUrl, a.deviceStatus, a.bpSign FROM `devonline` a, `dc` b WHERE a.deviceType = 1 and a.dcId = b.dcId";
			sqlString1 = "SELECT count(*) as recordsTotal FROM `devonline` a, `dc` b WHERE a.deviceType = 1 and a.dcId = b.dcId";
		} else if (2 == deviceType) {
			sqlString = "SELECT a.currentTime, a.deviceType, b.deviceUrl, a.deviceStatus, a.bpSign FROM `devonline` a, `meter` b WHERE a.deviceType = 2 and a.deviceId = b.deviceId";
			sqlString1 = "SELECT count(*) as recordsTotal FROM `devonline` a, `meter` b WHERE a.deviceType = 2 and a.deviceId = b.deviceId";
		} else {	
			sqlString = "SELECT a.currentTime, a.deviceType, b.dcUrl as deviceUrl, a.deviceStatus, a.bpSign FROM `devonline` a, `dc` b WHERE a.deviceType = 1 and a.dcId = b.dcId union SELECT a.currentTime, a.deviceType, c.deviceUrl, a.deviceStatus, a.bpSign FROM `devonline` a, `meter` c WHERE a. deviceType = 2 and a.deviceId = c.deviceId";
			sqlString1 = "SELECT count(*) as recordsTotal FROM `devonline` a ";
		}
		
		if (!sValue.equals("")) {
			sValue = sValue.replaceAll("年", "-");
			sValue = sValue.replaceAll("月", "-");
			sValue = sValue.replaceAll("日", "-");
			sArray = sValue.split(",");

			sArray[0] = sArray[0].substring(0, sArray[0].length()-1);
			sArray[1] = sArray[1].substring(0, sArray[1].length()-1);

			
			if (1 != deviceType && 2 != deviceType) {
				sqlString1 += " WHERE a.deviceType = a.deviceType";
				sqlString = "SELECT a.currentTime, a.deviceType, b.dcUrl as deviceUrl, a.deviceStatus, a.bpSign FROM `devonline` a, `dc` b WHERE a.deviceType = 1 and a.dcId = b.dcId and a.insertTime >= '$s_time' and a.insertTime <= '$e_time' union SELECT a.currentTime, a.deviceType, c.deviceUrl, a.deviceStatus, a.bpSign FROM `devonline` a, `meter` c WHERE a. deviceType = 2 and a.deviceId = c.deviceId and a.insertTime >= '$s_time' and a.insertTime <= '$e_time'";
			} else {
				sqlString += " and a.insertTime >= '$s_time' and a.insertTime <= '$e_time'";
			}
			sqlString1 += " and a.insertTime >= '$s_time' and a.insertTime <= '$e_time'";
		}
		
		sqlString += " limit $start, $length";

		Sql sql = Sqls.create(sqlString);

		sql.vars().set("deviceUrl", tsearch.toString()).set("start", start).set("length", length);
		
		if (!sValue.equals("")) {
			sql.vars().set("s_time", sArray[0]).set("e_time", sArray[1]);
		}

		System.out.println("sql:" + sql.toString());
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("currentTime",
							new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(rs.getDate("currentTime")));

					if (1 == rs.getInt("deviceType")) {
						map1.put("deviceType", "数据采集器");
					} else {
						map1.put("deviceType", "仪表");
					}
					map1.put("deviceUrl", rs.getString("deviceUrl"));
					int s = rs.getInt("deviceStatus");
					String deviceStatus = "离线";
					if (1 == s) {
						deviceStatus = "在线";
					} else if (2 == s) {
						deviceStatus = "重启";
					}
					map1.put("deviceStatus", deviceStatus);
					map1.put("bpSign", (rs.getInt("bpSign") == 0 ? "正常" : "重启"));
					data.add(map1);
				}
				return data;
			}
		});

		dao.execute(sql);

		Sql sql1 = Sqls.create(sqlString1);
		
		if (!sValue.equals("")) {
			sql1.vars().set("s_time", sArray[0]).set("e_time", sArray[1]);
		}

		sql1.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				int recordsTotal = 0;
				while (rs.next()) {
					recordsTotal = rs.getInt("recordsTotal");
				}
				return recordsTotal;
			}
		});
		dao.execute(sql1);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", draw + 1);
		map.put("recordsFiltered", sql1.getResult());
		map.put("recordsTotal", sql1.getInt());
		map.put("data", sql.getResult());

		return map;
	}
}
