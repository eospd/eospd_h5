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

import com.eospd.bean.CircuitInfo;
import com.eospd.bean.Dc;
import com.eospd.bean.DevOnline;

public class EnergyFlowDiagram {

	@At("/efd")
	@Ok("jsp:jsp.energy_flow_diagram")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String index() {
		return "";
	}

	@At("/efd_chart")
	@Ok("jsp:jsp.efd_chart")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public void efd_chart() {
	}

	@At("/efd_his")
	@Ok("jsp:jsp.efd_his")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public void efd_his() {
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/efd/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		List<CircuitInfo> items = dao.query(CircuitInfo.class, null, dao.createPager(start, length));

		List<Object> data = new ArrayList();
		for (int i = 0; i < items.size(); i++) {
			CircuitInfo d = items.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("circuitUrl", d.getCircuitUrl());
			map1.put("circuitName", d.getCircuitName());
			map1.put("location", "location:" + d.getLocation());
			map1.put("switchRatedC", d.getSwitchRatedC() + "A");
			map1.put("levelV", d.getLevelV() + "V");
			map1.put("designPower", d.getDesignPower());
			map1.put("powerPhase", d.getPowerPhase());
			map1.put("parentId", d.getParentId());

			data.add(map1);
		}

		String sqlString1 = "SELECT count(*) as recordsTotal FROM `circuitinfo` a";
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
		map.put("recordsTotal", sql1.getResult());
		map.put("recordsFiltered", sql1.getResult());

		map.put("data", data);
		return map;

	}

	@At("/efd/la")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public List<CircuitInfo> list_all(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		List<CircuitInfo> items = dao.query(CircuitInfo.class, null);

		return items;

	}

	@At("/efd/add")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map<Object, Object> add(@Param("..") CircuitInfo efd) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		dao.insert(efd);

		Map<Object, Object> map = new HashMap<Object, Object>();

		if (0 != efd.getCircuitId()) {
			map.put("code", 1);
		} else {
			map.put("code", 2);
		}
		
		map.put("efd", efd);
		return map;
	}
}
