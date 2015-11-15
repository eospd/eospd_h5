package com.eospd.modules;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.adaptor.VoidAdaptor;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.eospd.bean.CircuitInfo;
import com.eospd.bean.DataTableEdtorRequestDTO;
import com.eospd.bean.Dc;
import com.eospd.bean.Meter;
import com.eospd.bean.MeterType;

public class MeterManagement {

	private static final Log log = Logs.get();

	@At("/mm")
	@Ok("jsp:jsp.meter_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String index() {
		return "";
	}

	class DataList {
		private String DT_RowId;

		private List<Dc> dcs;

		public List<Dc> getDcs() {
			return dcs;
		}

		public String getDT_RowId() {
			return DT_RowId;
		}

		public void setDT_RowId(String dT_RowId) {
			DT_RowId = dT_RowId;
		}

		public void setDcs(List<Dc> dcs) {
			this.dcs = dcs;
		}
	}

	@SuppressWarnings({ "rawtypes" })
	@AdaptBy(type = VoidAdaptor.class)
	@At("/mm/dc/staff")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map dc_staff(HttpServletRequest req) {
		DataTableEdtorRequestDTO mm = new DataTableEdtorRequestDTO(req);

		String action = mm.getAction().trim();
		System.out.println("action:" + mm.getAction());

		Iterator<String> item = mm.getData().keySet().iterator();
		List<Object> datas = new ArrayList<Object>();

		while (item.hasNext()) {
			String rowKey = item.next();
			System.out.println("rowKey:" + rowKey);

			Map<String, String> dcMap = mm.getData().get(rowKey);

			System.out.println("dcMap.get(\"dcUrl\"):" + dcMap.get("dcUrl"));

			Dc dc = new Dc();
			dc.setDcUrl(dcMap.get("dcUrl"));
			dc.setDcName(dcMap.get("dcName"));
			dc.setLocation(dcMap.get("location"));
			dc.setDesc(dcMap.get("desc"));
			dc.setChannelCount(Integer.parseInt(dcMap.get("channelCount")));
			dc.setDcIP(dcMap.get("dcIP"));
			dc.setInsertTime(new Date(System.currentTimeMillis()));
			dc.setInstallTime(new Date(System.currentTimeMillis()));

			Dao dao = Mvcs.getIoc().get(Dao.class);

			if (action.equals("create")) {
				System.out.println("getAction:" + action);
				dao.insert(dc);
			} else if (action.equals("edit")) {
				Dc dc0 = dao.fetch(Dc.class, Cnd.where("dcUrl", "=", dc.getDcUrl()));
				dc.setDcId(dc0.getDcId());
				dao.update(Dc.class, Chain.from(dc), Cnd.where("dcId", "=", dc0.getDcId()));

			} else if (action.equals("remove")) {
				Dc dc0 = dao.fetch(Dc.class, Cnd.where("dcUrl", "=", dc.getDcUrl()));
				dao.delete(dc0);
			} else {
				System.out.println("getAction:" + action);
			}
			datas.add(dc);
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("data", datas);
		return map;
	}

	@SuppressWarnings({ "rawtypes" })
	@AdaptBy(type = VoidAdaptor.class)
	@At("/mm/meter/staff")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map meter_staff(HttpServletRequest req) {
		DataTableEdtorRequestDTO mm = new DataTableEdtorRequestDTO(req);

		String action = mm.getAction().trim();
		System.out.println("action:" + mm.getAction());

		Iterator<String> item = mm.getData().keySet().iterator();
		List<Object> datas = new ArrayList<Object>();
		while (item.hasNext()) {
			String rowKey = item.next();
			System.out.println("rowKey:" + rowKey);

			Map<String, String> dcMap = mm.getData().get(rowKey);
			System.out.println("dcMap.get(\"dcUrl\"):" + dcMap.get("dcUrl"));

			Meter meter = new Meter();
			meter.setDeviceUrl(dcMap.get("deviceUrl"));
			meter.setDeviceCommAddr(dcMap.get("deviceCommAddr"));
			meter.setLocation(dcMap.get("location"));
			meter.setDesc(dcMap.get("desc"));
			meter.setInsertTime(new Date(System.currentTimeMillis()));
			meter.setInstallTime(new Date(System.currentTimeMillis()));
			meter.setUpdateTime(new Date(System.currentTimeMillis()));
			meter.setAutoSign(0);
			if (!action.equals("remove")) {
				meter.setDataTypeId(Integer.valueOf(dcMap.get("typeName")));
				meter.setDcId(Integer.valueOf(dcMap.get("dcUrl")));
			}
			
			Dao dao = Mvcs.getIoc().get(Dao.class);

			if (action.equals("create")) {
				System.out.println("getAction:" + action);
				CircuitInfo circuit = dao.fetch(CircuitInfo.class, Cnd.where("circuitId", "=", dcMap.get("circuitUrl")));
				meter = dao.insert(meter);
				circuit.setDeviceId(meter.getDeviceId());
				dao.insert(circuit);
				
			} else if (action.equals("edit")) {
				meter.setDeviceId(Integer.valueOf(dcMap.get("deviceId")));
				dao.update(Meter.class, Chain.from(meter), Cnd.where("deviceId", "=", meter.getDeviceId()));
				
				CircuitInfo circuit = dao.fetch(CircuitInfo.class, Cnd.where("circuitId", "=", dcMap.get("circuitUrl")));
				circuit.setDeviceId(Integer.valueOf(dcMap.get("deviceId")));
				dao.update(Meter.class, Chain.from(circuit), Cnd.where("circuitId", "=", dcMap.get("circuitUrl")));

			} else if (action.equals("remove")) {
				meter.setDeviceId(Integer.valueOf(dcMap.get("deviceId")));
				dao.delete(meter);
			} else {
				System.out.println("getAction:" + action);
			}
			datas.add(meter);
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("data", datas);
		return map;
	}

	@SuppressWarnings({ "rawtypes" })
	@At("/mm/meter/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map meter_list(@Param(value = "start") int start, @Param(value = "length") int length,
			@Param(value = "draw") int draw, @Param("search[value]") String tsearch) {

		Dao dao = Mvcs.getIoc().get(Dao.class);

		String sqlString = "SELECT a.deviceId, a.installTime, a.deviceUrl, b.typeName, a.deviceCommAddr, a.location, a.desc, c.dcUrl, d.circuitUrl FROM `meter` a, `metertype` b, `dc` c, `circuitinfo` d WHERE a.dataTypeId = b.dataTypeId and a.dcId = c.dcId and a.deviceId = d.deviceId limit $start, $length";

		if (tsearch.length() != 0) {
			sqlString = "SELECT a.deviceId, a.installTime, a.deviceUrl, b.typeName, a.deviceCommAddr, a.location, a.desc, c.dcUrl, `circuitinfo` d  FROM `meter` a, `metertype` b, `dc` c, `circuitinfo` d WHERE a.dataTypeId = b.dataTypeId and a.dcId = c.dcId and a.deviceId = d.deviceId and b.dataUrl = \"$dataUrl\" limit $start, $length";
		}
		Sql sql = Sqls.create(sqlString);

		sql.vars().set("dataUrl", tsearch.toString()).set("start", start).set("length", length);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {

				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("deviceId", rs.getString("deviceId"));
					map1.put("deviceUrl", rs.getString("deviceUrl"));
					map1.put("typeName", rs.getString("typeName"));
					map1.put("deviceCommAddr", "" + rs.getString("deviceCommAddr"));
					map1.put("location", "" + rs.getString("location"));
					map1.put("desc", "" + rs.getString("desc"));
					map1.put("installTime", rs.getString("installTime"));
					map1.put("circuitUrl", rs.getString("circuitUrl"));
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

				int rowCnt = 0;
				List<Object> data = new ArrayList<Object>();
				while (rs.next()) {
					Map<Object, Object> map1 = new HashMap<Object, Object>();
					map1.put("DT_RowId", "row_" + rowCnt++);
					map1.put("dcUrl", rs.getString("dcUrl"));
					map1.put("dcName", "" + rs.getString("dcName"));
					map1.put("location", "" + rs.getString("location"));
					map1.put("desc", "" + rs.getString("desc"));
					map1.put("channelCount", "" + rs.getString("channelCount"));
					map1.put("dcIP", rs.getString("dcIP"));
					map1.put("installTime",
							new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(rs.getDate("installTime")));

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
	
	@At("/mm/metertypes")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public List<MeterType> metertypes_json() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<MeterType> items = dao.query(MeterType.class, null);
		return items;
	}
	
	@At("/mm/circuits")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public List<CircuitInfo> circuits_json() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<CircuitInfo> items = dao.query(CircuitInfo.class, null);
		return items;
	}
}
