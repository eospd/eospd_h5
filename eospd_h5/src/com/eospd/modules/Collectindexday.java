package com.eospd.modules;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.adaptor.PairAdaptor;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

public class Collectindexday {

	@At("/")
	@Ok("jsp:jsp.index")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public void index() {
	}

	@At("/col_his")
	@Ok("jsp:jsp.col_his")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public void his() {
	}

	@SuppressWarnings({ "rawtypes" })
	@At("/cid/list")
	@AdaptBy(type=PairAdaptor.class)
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list(@Param(value = "start") int start, @Param(value = "length") int length, @Param(value = "draw") int draw) {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		
		Sql sql = Sqls.create("SELECT a.indexTime, b.deviceUrl, a.dataEffRate, a.meterOnlineRate, a.realCollectRate  FROM `collectindexday` a, `meter` b WHERE a.deviceId = b.deviceId limit $start, $length");
		
		sql.vars().set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("currentTime", rs.getDate("indexTime"));
					map1.put("meterUrl", rs.getString("deviceUrl"));
					map1.put("dataEffRate", rs.getDouble("dataEffRate"));
					map1.put("meterOnlineRate", rs.getDouble("meterOnlineRate"));
					map1.put("realCollectRate", rs.getDouble("realCollectRate"));
					data.add(map1);
				}
				return data;
			}
		});
		
		dao.execute(sql);
		
		Sql sql1 = Sqls.create("SELECT count(*) as recordsTotal FROM `collectindexday`");

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
		map.put("draw", draw+1);
		map.put("recordsFiltered", sql1.getResult());
		map.put("recordsTotal", sql1.getInt());
		map.put("data", sql.getResult());
		
		return map;
	}
}
