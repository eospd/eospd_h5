package com.eospd.modules;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.dao.Cnd;
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

import com.eospd.bean.CollectIndexDay;

public class Collectindexday {

	@At("/index")
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
	@At("/cid/sys_spec")
	@AdaptBy(type = PairAdaptor.class)
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map system_specification(@Param(value = "s_time") Date s_time, @Param(value = "e_time") Date e_time) {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		
		Sql sql = Sqls.create("SELECT ((100.0* sum(commValid)) / sum(planCollectCnt)) as commValid, " +
					"((100.0* sum(dataValid)) / sum(planCollectCnt)) as dataValid, " +
					"((100.0* sum(dataQuality)) / sum(planCollectCnt)) as dataQuality " +
					"FROM v_dataquality where qualityTime >= @s_time and qualityTime < @e_time;");
		
		sql.params().set("s_time", s_time);
		sql.params().set("e_time", e_time);
		
	    sql.setCallback(new SqlCallback() {
	        public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
	        	
	        	Map<Object, Object> map = new HashMap<Object, Object>();
	        	
	        	if (rs.next()) {
	                map.put("commValid", String.format("%.2f", rs.getDouble("commValid")));
	                map.put("dataValid",  String.format("%.2f", rs.getDouble("dataValid")));
	                map.put("dataQuality",  String.format("%.2f", rs.getDouble("dataQuality")));
	            }
	            
	            return map;
	        }
	    });
	    
	    dao.execute(sql);
		return (Map) sql.getResult();
	}
	
	@SuppressWarnings({ "rawtypes" })
	@At("/cid/data_query")
	@AdaptBy(type = PairAdaptor.class)
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map data_query(@Param(value = "s_time") Date s_time, @Param(value = "e_time") Date e_time) {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		
		Sql sql = Sqls.create("SELECT SUM(realNormalCnt) as realNormalCnt, SUM(retranNormalCnt) as retranNormalCnt, SUM(dataRepairCnt) as dataRepairCnt,  SUM(dataErrCnt) as dataErrCnt, SUM(dataLoseCnt) as dataLoseCnt " +
					"FROM v_dataquality where qualityTime >= @s_time and qualityTime < @e_time;");
		
		sql.params().set("s_time", s_time);
		sql.params().set("e_time", e_time);
		
	    sql.setCallback(new SqlCallback() {
	        public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
	        	
	        	Map<Object, Object> map = new HashMap<Object, Object>();
	        	
	            if (rs.next()) {
	                map.put("realNormalCnt", rs.getInt("realNormalCnt"));
	                map.put("retranNormalCnt", rs.getInt("retranNormalCnt"));
	                map.put("dataRepairCnt", rs.getInt("dataRepairCnt"));
	                map.put("dataErrCnt", rs.getInt("dataErrCnt"));
	                map.put("dataLoseCnt", rs.getInt("dataLoseCnt"));
	            }
	            
	            return map;
	        }
	    });
	    
	    dao.execute(sql);
		return (Map) sql.getResult();
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@At("/cid/list")
	@AdaptBy(type = PairAdaptor.class)
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "SELECT a.indexTime, b.deviceUrl, a.dataEffRate, a.meterOnlineRate, a.realCollectRate  FROM `collectindexday` a, `meter` b WHERE a.deviceId = b.deviceId limit $start, $length";

		if (tsearch.length() != 0) {
			sqlString = "SELECT a.indexTime, b.deviceUrl, a.dataEffRate, a.meterOnlineRate, a.realCollectRate  FROM `collectindexday` a, `meter` b WHERE a.deviceId = b.deviceId and b.deviceUrl = \"$deviceUrl\" limit $start, $length";
		}
		Sql sql = Sqls.create(sqlString);

		sql.vars().set("deviceUrl", tsearch.toString()).set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("currentTime",
							new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(rs.getDate("indexTime")));
					map1.put("meterUrl", rs.getString("deviceUrl"));
					map1.put("dataEffRate", rs.getDouble("dataEffRate") + "%");
					map1.put("meterOnlineRate", rs.getDouble("meterOnlineRate") + "%");
					map1.put("realCollectRate", rs.getDouble("realCollectRate") + "%");
					data.add(map1);
				}
				return data;
			}
		});

		dao.execute(sql);

		String sqlString1 = "SELECT count(*) as recordsTotal FROM `collectindexday` a";
		if (tsearch.length() != 0) {
			sqlString1 = "SELECT count(*) as recordsTotal FROM `collectindexday` a, `meter` b WHERE a.deviceId = b.deviceId and b.deviceUrl = \"$deviceUrl\"";
		}

		Sql sql1 = Sqls.create(sqlString1);
		sql1.vars().set("deviceUrl", tsearch.toString());

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
