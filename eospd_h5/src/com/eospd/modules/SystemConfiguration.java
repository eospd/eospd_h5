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

public class SystemConfiguration {

	@At("/sc")
	@Ok("jsp:jsp.system_configuration")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public void index() {
	}
	
	@SuppressWarnings({ "rawtypes" })
	@At("/sc/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map dc_list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "SELECT a.typeUrl, a.typeName, a.desc, b.venderName, b.venderAddr, b.contactPhone, b.contactPerson FROM `metertype` a, `metervender` b WHERE a.venderId = b.venderId limit $start, $length";

		Sql sql = Sqls.create(sqlString);

		sql.vars().set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("typeUrl", rs.getString("typeUrl"));
					map1.put("typeName", ""+rs.getString("typeName"));
					map1.put("desc", ""+rs.getString("desc"));
					map1.put("venderName", ""+rs.getString("venderName"));
					map1.put("venderAddr", ""+rs.getString("venderAddr"));
					map1.put("contactPhone", ""+rs.getString("contactPhone"));
					map1.put("contactPerson", ""+rs.getString("contactPerson"));

					data.add(map1);
				}
				return data;
			}
		});

		dao.execute(sql);

		String sqlString1 = "SELECT count(*) as recordsTotal FROM `metertype` a";
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
