package com.eospd.modules;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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
	
	@At("/datam_chart")
    @Ok("jsp:jsp.data_manage_chart")
    @Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String chart() {
        return "";
    }

	@At("/datam_list")
    @Ok("jsp:jsp.data_manage_list")
    @Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String his() {
        return "";
    }
	
	@At("/test")
	@Ok("jsp:jsp.test")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String test() {
		return "";
	}	

	@SuppressWarnings({ "rawtypes" })
	@At("/dm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch, @Param("columns[0][search][value]") String searchTime) {
		
		String whereSql = "";
		if (searchTime.contains(",")) {
			searchTime = searchTime.replace("年", "-").replace("月", "-").replace("日", "");
			String stime = searchTime.split(",")[0];
			String etime = searchTime.split(",")[1];
			
			whereSql = " WHERE currentTime >= '" + stime + "' and currentTime <= '" + etime + "'";
		}

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "SELECT a.currentTime, a.bpSign, b.dataUrl, a.ivSign, a.p1Pv, a.p1Err, a.p1Dv, a.p1Rsz, a.p25Pv, a.p37Pv FROM `dataontime` a left join `dataurl` b on a.dataId = b.dataId " + whereSql + " limit $start, $length";

		Sql sql = Sqls.create(sqlString);

		sql.vars().set("dataUrl", tsearch.toString()).set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					String time = rs.getString("currentTime");
                    if (time.endsWith(".0")) {
                        time = time.replace(".0", "");
                    }
                    map1.put("currentTime", time);
					
                    map1.put("bpSign", (rs.getInt("bpSign") == 0 ? "正常" : "续传"));
					map1.put("dataUrl", rs.getString("dataUrl") + " ");
					map1.put("ivSign", (rs.getInt("ivSign") == 0 ? "正常" : "插值"));

					String value = rs.getString("p1Pv");
					if (value == null || value.isEmpty()) {
					    map1.put("p1Pv", "");
					} else {
					    map1.put("p1Pv", (((int)(100*rs.getFloat("p1Pv")))/100.0 /*+ "KWh"*/));
					}
					
					map1.put("p1Err", (rs.getInt("p1Err") == 1 ? "错误" : "正常"));
					
					value = rs.getString("p1Dv");
					if (value == null || value.isEmpty()) {
                        map1.put("p1Dv", "");
                    } else {
                        map1.put("p1Dv", (((int)(100*rs.getFloat("p1Dv")))/100.0 /*+ "KWh"*/));
                    }
					map1.put("p1Rsz", (rs.getInt("p1Rsz") == 0 ? "正常" : "归零"));
					
					value = rs.getString("p25Pv");
					if (value == null || value.isEmpty()) {
                        map1.put("p25Pv", "");
                    } else {
                        map1.put("p25Pv", (((int)(100*rs.getFloat("p25Pv")))/100.0 /*+ "KWh"*/));
                    }
					
					value = rs.getString("p37Pv");
					if (value == null || value.isEmpty()) {
					    map1.put("p37Pv", "");
					} else {
					    map1.put("p37Pv", (((int)(100*rs.getFloat("p37Pv")))/100.0));
					}
					data.add(map1);
				}
				return data;
			}
		});

		dao.execute(sql);

		String sqlString1 = "SELECT count(*) as recordsTotal FROM `dataontime` a left join `dataurl` b on a.dataId = b.dataId" + whereSql;
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
