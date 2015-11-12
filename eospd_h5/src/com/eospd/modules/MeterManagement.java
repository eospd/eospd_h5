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

import com.eospd.bean.Dc;
import com.eospd.bean.Meter;

public class MeterManagement {

	@At("/mm")
	@Ok("jsp:jsp.meter_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String index() {
		return "";
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/mm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<Dc> items = dao.query(Dc.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", items.size());
		map.put("recordsFiltered", items.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < items.size(); i++) {
			Dc d = items.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("currentTime", d.getInsertTime());
			map1.put("meterId", d.getDcId());
			map1.put("meterName", d.getDcUrl());
			map1.put("dcId", d.getDcId());
			map1.put("dcName", d.getDcId());
			map1.put("venderName", d.getDcId());
			map1.put("circuitName", d.getDcId());
			data.add(map1);
		}
		map.put("data", data);
		return map;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@At("/mm/meter/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map meter_list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "SELECT a.deviceUrl, b.typeName, a.deviceCommAddr, a.location, a.desc, c.dcUrl FROM `meter` a, `metertype` b, `dc` c WHERE a.dataTypeId = b.dataTypeId and a.dcId = c.dcId limit $start, $length";

		if (tsearch.length() != 0) {
			sqlString = "SELECT a.deviceUrl, b.typeName, a.deviceCommAddr, a.location, a.desc, c.dcUrl FROM `meter` a, `metertype` b, `dc` c WHERE a.dataTypeId = b.dataTypeId and a.dcId = c.dcId and b.dataUrl = \"$dataUrl\" limit $start, $length";
		}
		Sql sql = Sqls.create(sqlString);

		sql.vars().set("dataUrl", tsearch.toString()).set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("deviceUrl", rs.getString("deviceUrl"));
					map1.put("typeName", rs.getString("typeName"));
					map1.put("deviceCommAddr", ""+rs.getString("deviceCommAddr"));
					map1.put("location", ""+rs.getString("location"));
					map1.put("desc", ""+rs.getString("desc"));
					map1.put("dcUrl", rs.getString("dcUrl"));

					data.add(map1);
				}
				return data;
			}
		});

		dao.execute(sql);

		String sqlString1 = "SELECT count(*) as recordsTotal FROM `meter` a";
		Sql sql1 = Sqls.create(sqlString1);

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
	
	@SuppressWarnings({ "rawtypes" })
	@At("/mm/dc/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map dc_list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "SELECT a.dcUrl, a.dcName, a.location, a.desc, a.channelCount, a.dcIP, a.installTime FROM `dc` a limit $start, $length";

		if (tsearch.length() != 0) {
			sqlString = "SELECT a.dcUrl, a.dcName, a.location, a.desc, a.channelCount, a.dcIP, a.installTime FROM `dc` a WHERE a.dcUrl = \"$dataUrl\" limit $start, $length";
		}
		Sql sql = Sqls.create(sqlString);

		sql.vars().set("dataUrl", tsearch.toString()).set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("dcUrl", rs.getString("dcUrl"));
					map1.put("dcName", ""+rs.getString("dcName"));
					map1.put("location", ""+rs.getString("location"));
					map1.put("desc", ""+rs.getString("desc"));
					map1.put("channelCount", ""+rs.getString("channelCount"));
					map1.put("dcIP", rs.getString("dcIP"));
					map1.put("installTime", new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(rs.getDate("installTime")));

					data.add(map1);
				}
				return data;
			}
		});

		dao.execute(sql);

		String sqlString1 = "SELECT count(*) as recordsTotal FROM `dc` a";
		Sql sql1 = Sqls.create(sqlString1);

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

	@At("/mm/meters")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public List<Meter> meter_json() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<Meter> items = dao.query(Meter.class, null);
		return items;
	}

	@At("/mm/dcs")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public List<Dc> dcs_json() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<Dc> items = dao.query(Dc.class, null);
		return items;
	}
}
