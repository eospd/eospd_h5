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

import com.eospd.bean.DataOnTime;
import com.eospd.bean.Dc;

public class DataManagement {

	@At("/dm")
	@Ok("jsp:jsp.data_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String index() {
		return "";
	}

	@At("/test")
	@Ok("jsp:jsp.test")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String test() {
		return "";
	}
	
	@SuppressWarnings({ "rawtypes"})
	@At("/dm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map 		list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw,
			@Param("search[value]") String tsearch) {
			
			Dao dao = Mvcs.getIoc().get(Dao.class);
			
			String sqlString = "SELECT a.currentTime, a.bpSign, b.dataUrl, a.ivSign, a.p1Pv, a.p1Err, a.p1Dv, a.p1Rsz, a.p2Pv, a.p3Pv, a.p4Pv, a.p5Pv, a.p6Pv, a.p7Pv, a.p8Pv, a.p9Pv FROM `dataontime` a, `dataurl` b WHERE a.dataId = b.dataId limit $start, $length";

			if (tsearch.length() != 0){
				sqlString = "SELECT a.currentTime, a.bpSign, b.dataUrl, a.ivSign, a.p1Pv, a.p1Err, a.p1Dv, a.p1Rsz, a.p2Pv, a.p3Pv, a.p4Pv, a.p5Pv, a.p6Pv, a.p7Pv, a.p8Pv, a.p9Pv FROM `dataontime` a, `dataurl` b WHERE a.dataId = b.dataId  and b.dataUrl = \"$dataUrl\" limit $start, $length";
			}
			Sql sql = Sqls.create(sqlString);
			
			sql.vars().set("dataUrl", tsearch.toString()).set("start", start).set("length", length);
			
			sql.setCallback(new SqlCallback() {
				public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

					List<Object> data = new ArrayList<Object>();
					while (rs.next()) {
						Map<Object, Object> map1 = new HashMap<Object, Object>();
						map1.put("currentTime",
								new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(rs.getDate("currentTime")));
						map1.put("bpSign", (rs.getInt("bpSign") == 0 ? "正常" : "重传"));
						map1.put("dataUrl", rs.getString("dataUrl"));
						map1.put("ivSign", (rs.getInt("ivSign") == 0 ? "正常" : "插值"));
						map1.put("p1Pv", (rs.getInt("p1Pv") + "kW·h"));
						map1.put("p1Err", (rs.getInt("bpSign") == 0 ? "正常" : "错误"));
						map1.put("p1Dv", (rs.getInt("p1Dv") + "kW·h"));
						map1.put("p1Rsz", (rs.getInt("p1Rsz") == 0 ? "正常" : "归零"));
						map1.put("p2Pv", (rs.getInt("p2Pv") + "kW"));
						map1.put("p3Pv", (rs.getInt("p3Pv")));
						map1.put("p4Pv", (rs.getInt("p4Pv") + "A"));
						map1.put("p5Pv", (rs.getInt("p5Pv") + "A"));
						map1.put("p6Pv", (rs.getInt("p6Pv") + "A"));
						map1.put("p7Pv", (rs.getInt("p7Pv") + "V"));
						map1.put("p8Pv", (rs.getInt("p8Pv") + "V"));
						map1.put("p9Pv", (rs.getInt("p9Pv") + "V"));
						data.add(map1);
					}
					return data;
				}
			});

			dao.execute(sql);
			
			String sqlString1 = "SELECT count(*) as recordsTotal FROM `dataontime` a";
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

}
